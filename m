From: Pry Mar <pryorm09@gmail.com>
Subject: xen-4.12~rc1 in ub1804: no vfb objects in pv domU,
 bug or feature?
Date: Sun, 27 Jan 2019 14:15:52 -0800
Message-ID: <CAHnBbQ_69nOP2NsSy0rtzbBocUJRHnBxnJ9AX7yaqH_dTg7FJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LZsX=QD=gmail.com=pryorm09@srs-us1.protection.inumbo.net>)
 id 1gnsiZ-0006dz-Dy
 for xen-devel@lists.xenproject.org; Sun, 27 Jan 2019 22:15:55 +0000
Received: by mail-it1-x141.google.com with SMTP id a6so16788011itl.4
 for <xen-devel@lists.xenproject.org>; Sun, 27 Jan 2019 14:15:53 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: anthony.perard@citrix.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

cWVtdSBidWlsZCBjb25maWc6Cmh0dHA6Ly9wYXN0ZS5kZWJpYW4ubmV0L3BsYWluLzEwNjI3Nzcv
Cgpkb21VIHN0YXJ0dXAgdHJhY2U6Cmh0dHA6Ly9wYXN0ZS5kZWJpYW4ubmV0L3BsYWluLzEwNjI3
NjgvCgpUaGlzIHJlbGVhc2UgdXNlcyBxZW11LTMuMC4wIHdoaWNoIGhhcyBhIGRlcGVuZHMgb24g
bGlieGVudG9vbGNvcmUuCgpJbiB4ZW4tNC4xMS4xIHdpdGggcWVtdS0yLjExLjIgdmZiIG9iamVj
dHMgKFZOQykgYWx3YXlzIHdvcmtlZCBpbiBwdgpkb21VLiBPbmx5IG5vdyB3aXRoIHFlbXUtMy54
IGlzIGl0IGZhaWxpbmc6IHRoZSBkb21VIHN0b3BzIGFuZCBjbG9zZXMuCgpJIHNlZSB0aGV5IGFy
ZSBwYXRjaGluZyB0b29scy9xZW11LXhlbi9jb25maWd1cmUgaGVyZToKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTAxL21zZzAxNjk2Lmh0
bWwKCmFuZCB0aGF0IG1pZ2h0IGJlIHJlbGF0ZWQuIEkgaGF2ZSB0aGUgc2FtZSBiYWQgYmVoYXZp
b3IgZXZlbiB1c2luZyB0aGUKZGViaWFuLXFlbXUgc291cmNlcyBmb3IgcWVtdS0zLjEuMCwgYW5k
IGV2ZW4gd2hlbiB0aGF0IGlzIHVzZWQgaW4KeGVuLTQuMTEuMS4KCkknbSBidWlsZGluZyBpbiB1
YjE4MDQgd2l0aCBhIGRlYmlhbiBkZWx0YSB1c2luZyB0aGUgb2xkIHBhY2thZ2luZwpzY2hlbWUs
IGJ1dCBhIHRhcmdldCBmb3IgcWVtdXUgaXMgaW5jbHVkZWQuCgpQcnlNYXI1NgojI3hlbi1wYWNr
YWdpbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
