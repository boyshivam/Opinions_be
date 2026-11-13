

import '../models/post_model.dart';

final List<PostModel> dummyPosts = [
  PostModel(
    id: 1,
    ownerId: 101,
    title: 'Should cities have more car-free zones?',
    context: 'Would reducing car traffic make city centers better places to live, or just harder to reach?',
    genre: 'City life',
    votes: 24,
    postOwner: 'Maya',
    createdAt: DateTime(2026, 11, 5, 14, 30),
    published: true,
  ),
  PostModel(
    id: 2,
    ownerId: 102,
    title: 'Is working from home better for creativity?',
    context: 'Some people focus best at home, while others get their best ideas by working alongside a team.',
    genre: 'Work',
    votes: 17,
    postOwner: 'Arjun',
    createdAt: DateTime(2026, 11, 4, 9, 15),
    published: true,
  ),
  PostModel(
    id: 3,
    ownerId: 103,
    title: 'Should schools start later in the morning?',
    context: 'Would a later start help students learn, or make after-school activities more difficult?',
    genre: 'Education',
    votes: 32,
    postOwner: 'Leah',
    createdAt: DateTime(2026, 11, 3, 18, 0),
    published: true,
  ),
  PostModel(
    id: 4,
    ownerId: 104,
    title: 'Are subscription services getting out of hand?',
    context: 'Streaming, apps, and memberships add up. Which subscriptions are actually worth keeping?',
    genre: 'Technology',
    votes: 0,
    postOwner: 'Noah',
    createdAt: DateTime(2026, 11, 2, 12, 45),
    published: false,
  ),
];