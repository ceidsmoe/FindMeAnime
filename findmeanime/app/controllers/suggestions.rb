#gets a list of suggestions for a certain user
def get_suggestions(user)
  shows = weed_irrelevant(ALL_SHOWS, user.my_shows);
  shows = weed_seen(shows, user.my_shows);
  shows = make_twod(shows)
  user.reset_my_scores!;
  i=0;
  while(user.my_shows[i])
    j=0;
    while(shows[j,0])
      numliked = certain_opinion(user.my_shows[i], shows[j,0], user.opinion(user.my_shows[j]), 1).length;
      numhated = certain_opinion(user.my_shows[i], shows[j,0], user.opinion(user.my_shows[j]), -1).length;
      numneutral = certain_opinion(user.my_shows[i], shows[j,0], user.opinion(user.my_shows[j]), 0).length;
      total = numliked + numhated + numneutral;
      shows[j,1] = shows[j,1] + numliked/total - numhated/total;
      j++
    end
    i++
  end
  sorted_list = sort_by_score(shows);
  return sorted_list;
end

#removes shows from all_shows that are in my_shows
def weed_seen(all_shows, my_shows)
  i = 0;
  k = 0;
  while(all_shows[i])
    if(not my_shows.include?(all_shows[i]))
      shows[k] = all_shows[i];
      k = k + 1;
    end
    i = i + 1;
  end
  return shows;
end


#returns a list of shows after removing all shows from all_shows that do not have any users who have also watched something from my_shows
def weed_irrelevant(all_shows, my_shows)
  i = 0;
  k = 0;
  while(all_shows[i])
    j = 0;
    while(my_shows[j])
      if(shared_user(all_shows[i], my_shows[j]))
         shows[k] = all_shows[i];
         k = k + 1;
      end
      j = j + 1;
    end
    i = i + 1;
  end
  return shows
end

#returns the first user who has seen both shows.  Otherwise returns nil
def shared_user(show1, show2)
  i = 0
  while(all_users[i])
    if(all_users[i].my_shows.include?(show1) and all_users[i].my_shows.include?(show2))
      return all_users[i]
    end
  end
  return nil;
end

#creates a two dimensional array (the second dimension is default 0) for the show
def make_twod(my_shows)
  i = 0;
  while(my_shows[i])
    shows[i,0] = my_shows[i];
    shows[i,1] = 0;
    i = i + 1;
  end
  return shows;
end

#insertion sort 2d showlist by scores
def sort_by_score(shows)
  i = 1;
  while(shows[i - 1,0])
    temp[0] = shows[i,0];
    temp[1] = shows[i,1];
    j = i;
    while(j > 0 and shows[j - 1, 0]>temp[i,0])
      shows[j,0] = shows[j-1,0];
      shows[j,1] = shows[j-1,1];
      j = j - 1;
    end
    shows[j,0] = temp[0];
    shows[j,1] = temp[1];
    i = i + 1;
  end
  return shows;
end


#returns a list of users of who felt a certain way about a show
def certain_opinion(show1, show2, score1, score2)
  i = 0;
  k = 0;
  while(ALL_USERS[i])
    user = ALL_USERS[i]
    if(user.include?(show1) and user.include?(show2) and user.opinion(show1)==score1 and user.opinion(show2)==score2)
      result_users[k] = user;
      k = k+1;
    end
    i = i + 1;
  end
  return result_users;
end
