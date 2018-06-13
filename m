From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 3/9] xen/balloon: Share common memory
 reservation routines
Date: Tue, 12 Jun 2018 21:07:59 -0400
Message-ID: <124f3832-63b4-021d-0c6f-470229c7a056__24308.0054097392$1528852034$gmane$org@oracle.com>
References: <20180612134200.17456-1-andr2000@gmail.com>
 <20180612134200.17456-4-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvra=i7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fSuGh-00081Y-BS
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 01:08:11 +0000
In-Reply-To: <20180612134200.17456-4-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNi8xMi8yMDE4IDA5OjQxIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToK
CgoKT25lIG1vcmUgdGhpbmc6IHBsZWFzZSBhZGQgYSBjb21tZW50IGhlcmUgc2F5aW5nIHRoYXQg
ZnJhbWVzIGFycmF5IGlzIAphcnJheSBvZiBQRk5zIChpbiBYZW4gZ3JhbnVsYXJpdHkpLCB3aGlj
aCBpcyB3aGF0IApYRU5NRU1fcG9wdWxhdGVfcGh5c21hcCByZXF1aXJlcy4gQW5kIHJlbW92ZSAo
b3IgdXBkYXRlIHRvIG5hbWUgdGhlIAphY3R1YWwgY2FsbCB5b3UgYXJlIG1ha2luZykgdGhlIGNv
cnJlc3BvbmRpbmcgY29tbWVudCBpbiAKaW5jcmVhc2VfcmVzZXJ2YXRpb24oKS4KCgo+ICsKPiAr
aW50IHhlbm1lbV9yZXNlcnZhdGlvbl9pbmNyZWFzZShpbnQgY291bnQsIHhlbl9wZm5fdCAqZnJh
bWVzKQo+ICt7Cj4gKwlzdHJ1Y3QgeGVuX21lbW9yeV9yZXNlcnZhdGlvbiByZXNlcnZhdGlvbiA9
IHsKPiArCQkuYWRkcmVzc19iaXRzID0gMCwKPiArCQkuZXh0ZW50X29yZGVyID0gRVhURU5UX09S
REVSLAo+ICsJCS5kb21pZCAgICAgICAgPSBET01JRF9TRUxGCj4gKwl9Owo+ICsKPiArCXNldF94
ZW5fZ3Vlc3RfaGFuZGxlKHJlc2VydmF0aW9uLmV4dGVudF9zdGFydCwgZnJhbWVzKTsKPiArCXJl
c2VydmF0aW9uLm5yX2V4dGVudHMgPSBjb3VudDsKPiArCXJldHVybiBIWVBFUlZJU09SX21lbW9y
eV9vcChYRU5NRU1fcG9wdWxhdGVfcGh5c21hcCwgJnJlc2VydmF0aW9uKTsKPiArfQo+ICtFWFBP
UlRfU1lNQk9MX0dQTCh4ZW5tZW1fcmVzZXJ2YXRpb25faW5jcmVhc2UpOwoKCkFuZCBzaW1pbGFy
bHksIGhlcmUgd2UgYXJlIHJlcXVlc3RpbmcgR0ZOcywgYW5kIHVwZGF0ZSAKZGVjcmVhc2VfcmVz
ZXJ2YXRpb24oKS4KCgotYm9yaXMKCj4gKwo+ICtpbnQgeGVubWVtX3Jlc2VydmF0aW9uX2RlY3Jl
YXNlKGludCBjb3VudCwgeGVuX3Bmbl90ICpmcmFtZXMpCj4gK3sKPiArCXN0cnVjdCB4ZW5fbWVt
b3J5X3Jlc2VydmF0aW9uIHJlc2VydmF0aW9uID0gewo+ICsJCS5hZGRyZXNzX2JpdHMgPSAwLAo+
ICsJCS5leHRlbnRfb3JkZXIgPSBFWFRFTlRfT1JERVIsCj4gKwkJLmRvbWlkICAgICAgICA9IERP
TUlEX1NFTEYKPiArCX07Cj4gKwo+ICsJc2V0X3hlbl9ndWVzdF9oYW5kbGUocmVzZXJ2YXRpb24u
ZXh0ZW50X3N0YXJ0LCBmcmFtZXMpOwo+ICsJcmVzZXJ2YXRpb24ubnJfZXh0ZW50cyA9IGNvdW50
Owo+ICsJcmV0dXJuIEhZUEVSVklTT1JfbWVtb3J5X29wKFhFTk1FTV9kZWNyZWFzZV9yZXNlcnZh
dGlvbiwgJnJlc2VydmF0aW9uKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
