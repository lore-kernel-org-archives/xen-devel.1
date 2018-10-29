From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH V3 2/3] x86/mm: allocate logdirty_ranges for
 altp2ms
Date: Mon, 29 Oct 2018 09:33:03 -0600
Message-ID: <CABfawhk_d-+Jj_t-sPz6vPkdOqC03yEHdytim+imKxq4V+XCvQ@mail.gmail.com>
References: <1540816837-8936-1-git-send-email-rcojocaru@bitdefender.com>
 <1540816837-8936-3-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8gpi=nj=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gH9Xz-0003Ri-Rr
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 15:33:43 +0000
Received: by mail-wr1-x444.google.com with SMTP id g9-v6so9189548wrq.4
 for <xen-devel@lists.xenproject.org>; Mon, 29 Oct 2018 08:33:42 -0700 (PDT)
In-Reply-To: <1540816837-8936-3-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgNjo0MSBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBpcyBhIHByZS1yZXF1aXNp
dGUgZm9yIHRoZSBvbmUgZml4aW5nIFZHQSBsb2dkaXJ0eQo+IGZyZWV6ZXMgd2hlbiB1c2luZyBh
bHRwMm0uIEl0IG9ubHkgY29uY2VybnMgaXRzZWxmIHdpdGggdGhlCj4gcmFuZ2VzIGFsbG9jYXRp
b24gLyBkZWFsbG9jYXRpb24gLyBpbml0aWFsaXphdGlvbiBwYXJ0LiBXaGlsZQo+IHRvdWNoaW5n
IHRoZSBjb2RlLCBJJ3ZlIHN3aXRjaGVkIGdsb2JhbF9sb2dkaXJ0eSBmcm9tIGJvb2xfdAo+IHRv
IGJvb2wuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRk
ZWZlbmRlci5jb20+CgpUZXN0ZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVs
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
