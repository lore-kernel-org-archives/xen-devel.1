From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v6 07/15] argo: implement the register op
Date: Wed, 30 Jan 2019 20:15:56 -0800
Message-ID: <CACMJ4GYo26gfs1KYcAWzq9EC3fvuDPmANEgZni6U1m6pRUBYuA@mail.gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
 <1548295503-15946-8-git-send-email-christopher.w.clark@gmail.com>
 <5C4EE5560200007800211AA6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8IWo=QH=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gp3lp-000678-Tq
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 04:16:09 +0000
Received: by mail-lj1-x244.google.com with SMTP id g11-v6so1480147ljk.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jan 2019 20:16:09 -0800 (PST)
In-Reply-To: <5C4EE5560200007800211AA6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgMzoxOSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI0LjAxLjE5IGF0IDAzOjA0LCA8Y2hyaXN0b3BoZXIu
dy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gQEAgLTMxLDEzICszMiwyNyBAQAo+ID4gICNp
ZmRlZiBDT05GSUdfQ09NUEFUCj4gPiAgI2luY2x1ZGUgPGNvbXBhdC9hcmdvLmg+Cj4gPiAgQ0hF
Q0tfYXJnb19hZGRyOwo+ID4gK0NIRUNLX2FyZ29fcmVnaXN0ZXJfcmluZzsKPiA+ICBDSEVDS19h
cmdvX3Jpbmc7Cj4gPiAgI2VuZGlmCj4KPiBXaGF0IGFib3V0IHN0cnVjdCB4ZW5fYXJnb19yaW5n
X21lc3NhZ2VfaGVhZGVyPwoKYWNrIC0gZml4ZWQKCj4KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hs
YXQubHN0Cj4gPiArKysgYi94ZW4vaW5jbHVkZS94bGF0LmxzdAo+ID4gQEAgLTE1MCwzICsxNTAs
NCBAQAo+ID4gID8gICAgZmxhc2tfdHJhbnNpdGlvbiAgICAgICAgICAgICAgICB4c20vZmxhc2tf
b3AuaAo+ID4gID8gICAgYXJnb19hZGRyICAgICAgICAgICAgICAgICAgICAgICBhcmdvLmgKPiA+
ICA/ICAgIGFyZ29fcmluZyAgICAgICAgICAgICAgICAgICAgICAgYXJnby5oCj4gPiArPyAgICBh
cmdvX3JlZ2lzdGVyX3JpbmcgICAgICAgICAgICAgIGFyZ28uaAo+Cj4gVGhpcyBpbnNlcnRpb24g
d2FudHMgdG8gbW92ZSB1cCBhIGxpbmUgKHJlbGF0aXZlIHRvIHRoZSBhcmdvCj4gb25lcyB3aGlj
aCBhcmUgYWxyZWFkeSB0aGVyZSkgYXMgd2VsbCwgdG8gZml0IHRoZSBzZWNvbmRhcnkKPiBzb3J0
aW5nIGJ5IHN0cnVjdHVyZSBuYW1lLgoKYWNrCgpDaHJpc3RvcGhlcgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
