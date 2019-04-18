From: PGNet Dev <pgnet.dev@gmail.com>
Subject: Re: Xen 4.12.0 Dom0=pvh mode EFI variables 'not
 supported' after boot
Date: Wed, 17 Apr 2019 21:51:47 -0700
Message-ID: <ab29f7ca-9653-ae48-4de7-86a73e0bc7c2@gmail.com>
References: <21708669-ac14-d8f8-d513-a7e745c65861@gmail.com>
 <20190416105043.nbvx522kqy3p3svx@Air-de-Roger.citrite.net>
 <20190417120518.63ulfqksrx37ver5@Air-de-Roger.citrite.net>
 <c000684c-d930-6557-a35f-d76b94b296b7@gmail.com>
Reply-To: pgnet.dev@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y3tm=SU=gmail.com=pgnet.dev@srs-us1.protection.inumbo.net>)
 id 1hGz1c-0008KY-6v
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 04:51:52 +0000
Received: by mail-pg1-x543.google.com with SMTP id f6so587760pgs.8
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 21:51:50 -0700 (PDT)
In-Reply-To: <c000684c-d930-6557-a35f-d76b94b296b7@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@FreeBSD.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8xNy8xOSA4OjMwIFBNLCBQR05ldCBEZXYgd3JvdGU6Cj4gVGh4Lgo+IAo+IG5vdCBpZ25v
cmluZyB5b3UgLS0gb3BlbnN1c2Uga2VybmVsIGJ1aWxkIHN5c3RlbSBpcyBoYXZpbmcgYSBoaXNz
eS1maXQgCj4gYXRtOyBidWlsZHMgYXJlIGZhaWxpbmcuIDotLwo+IAo+IGlmIEkgY2FuJ3QgZ2V0
IGl0IHRvIGJlaGF2ZSBhIGJ1aWxkIGEgbmljZSBwa2cgZm9yIG1lLCBJJ2xsIHdvcmsgb24gYSAK
PiBtYW51YWwgc3Bpbi4KCldpdGggYSBwa2cgaW5zdGFuY2Ugb2YgeW91ci1wYXRjaGVkIGtlcm5l
bCA1LjAuOCwKCglodHRwczovL2J1aWxkLm9wZW5zdXNlLm9yZy9idWlsZC9ob21lOnBnbmQ6S2Vy
bmVsOnN0YWJsZS9vcGVuU1VTRV9MZWFwXzE1LjAveDg2XzY0L2tlcm5lbC1zb3VyY2UvX2xvZyAK
CQkuLi4KCQlbICAgNzlzXSArIHBhdGNoIC1zIC1GMCAtRSAtcDEgLS1uby1iYWNrdXAtaWYtbWlz
bWF0Y2ggLWkgL2hvbWUvYWJ1aWxkL3JwbWJ1aWxkL0JVSUxEL2tlcm5lbC1zb3VyY2UtNS4wLjgv
cGF0Y2hlcy5zdXNlL3ZmaW8tdHlwZTEtbGltaXQtZG1hLW1hcHBpbmdzLXBlci1jb250YWluZXIK
Pj4+CQlbICAgNzlzXSArIHBhdGNoIC1zIC1GMCAtRSAtcDEgLS1uby1iYWNrdXAtaWYtbWlzbWF0
Y2ggLWkgL2hvbWUvYWJ1aWxkL3JwbWJ1aWxkL0JVSUxEL2tlcm5lbC1zb3VyY2UtNS4wLjgvcGF0
Y2hlcy5hZGRvbi94ZW4tcHZoLXVlZmkucGF0Y2gKCQlbICAgNzlzXSArKyBmaW5kIC4gLW5hbWUg
LmdpdGlnbm9yZQoJCS4uLgoKIGFuZCBEb209cHZoIGVuYWJsZWQsCgoJLi4uCglYZW4gNC4xMi4w
XzEwLWxwMTUwLjY0NyAoYy9zICkgRUZJIGxvYWRlcgoJVXNpbmcgY29uZmlndXJhdGlvbiBmaWxl
ICd4ZW4tNC4xMi4wXzEwLWxwMTUwLjY0Ny5jZmcnCgl2bWxpbnV6LTUuMC44LWxwMTUwLjIuZzhi
ODg1NTMtZGVmYXVsdDogMHgwMDAwMDAwMDhiODk5MDAwLTB4MDAwMDAwMDA4YzA2OGRiOAoJaW5p
dHJkLTUuMC44LWxwMTUwLjIuZzhiODg1NTMtZGVmYXVsdDogMHgwMDAwMDAwMDhhNzIwMDAwLTB4
MDAwMDAwMDA4Yjg5ODYxOAoJLi4uCgkoWEVOKSBbMDAwMDAwMjdjNjNjMTY3NF0gWGVuIHZlcnNp
b24gNC4xMi4wXzEwLWxwMTUwLjY0NwoJLi4uCgkoWEVOKSBbMDAwMDAwMjdjYWEzYWQ4MF0gQ29t
bWFuZCBsaW5lOiBkb20wPXB2aCBkb20wLWlvbW11PW1hcC1yZXNlcnZlZCAuLi4KCS4uLgoKaXQg
Ym9vdHMgT0ssCgoJeGwgbGlzdAoJCU5hbWUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgSUQgICBNZW0gVkNQVXMgICAgICBTdGF0ZSAgIFRpbWUocykKCQlEb21haW4tMCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwICA0MDE1ICAgICA0ICAgICByLS0t
LS0gICAgICA2Mi4xCgkJWGVuc3RvcmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMSAgICAzMSAgICAgMSAgICAgLWItLS0tICAgICAgIDAuMAoKYnV0IHN0aWxsCgoJZWZpYm9v
dG1nciAtdgoJCUVGSSB2YXJpYWJsZXMgYXJlIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBzeXN0ZW0u
CgkJZXJyb3IgdHJhY2U6CgpHaXZlbiBzb21lIG9mIHRoZSBidWlsZCAnZnVuJyBJJ3ZlIGJlZW4g
aGF2aW5nIHRvZGF5LCBJJ2xsIHRha2UgYSBjbG9zZXIgbG9vayBhdCB0aGUgcGF0Y2hlZCBrZXJu
ZWwgYnVpbGQgaW4gdGhlIG1vcm5pbmcgLS0gdG8gbWFrZSBkb3VibHkgc3VyZSBJIGFjdHVhbGx5
IGJ1aWx0IGNvcnJlY3RseS4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
