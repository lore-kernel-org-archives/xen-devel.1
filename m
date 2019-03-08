From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v11 5/9] xen/x86: use DECLARE_BOUNDS as
 required
Date: Fri, 8 Mar 2019 15:36:44 +0000
Message-ID: <23682.35852.523664.176866@mariner.uk.xensource.com>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-5-git-send-email-sstabellini@kernel.org>
 <5C7FEBBC020000780021C308@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1903061318160.17248@sstabellini-ThinkPad-X260>
 <5C80DB6A020000780021C58D@prv1-mh.provo.novell.com>
 <23681.11803.719165.841685@mariner.uk.xensource.com>
 <5C82262F0200007800150159@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DpA2=RL=citrix.com=prvs=963cf6c57=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1h2HYO-0007dJ-LW
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 15:36:56 +0000
In-Reply-To: <5C82262F0200007800150159@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "stefanos@xilinx.com" <stefanos@xilinx.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSCB2MTEgNS85XSB4ZW4veDg2OiB1c2UgREVD
TEFSRV9CT1VORFMgYXMgcmVxdWlyZWQiKToKPiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0
cml4LmNvbT4gMDMvMDcvMTkgMzo0NCBQTSA+Pj4KPiA+SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6
IFtQQVRDSCB2MTEgNS85XSB4ZW4veDg2OiB1c2UgREVDTEFSRV9CT1VORFMgYXMgcmVxdWlyZWQi
KToKPiA+PiBJJ2QgbGlrZSB0byBub3RlIHRob3VnaCB0aGF0IGluIHRoZSBmaXJzdCB0d28gY2Fz
ZXMgd2UgZG9uJ3QgYWx0ZXIgdGhlCj4gPj4gZGVjbGFyZWQgb2JqZWN0IGFueXdheSwgYnV0IGlu
c3RlYWQgYSBkZXJpdmVkIG9uZTsgdGhlIGRlY2xhcmF0aW9uCj4gPj4gc2hvdWxkIG5vdCB1c2Ug
Y29uc3QgZm9yIG90aGVyIHJlYXNvbnMgdGhvdWdoLiBBbmQgdGhlIDNyZCBjYXNlIGlzCj4gPj4g
ZmlkZGxpbmcgd2l0aCBzb21ldGhpbmcgdGhhdCBoYXMgbG9zdCBpdHMgbWVhbmluZyBhcyBhbiBv
YmplY3QuIEluIGZhY3QKPiA+PiB3ZSdyZSBhYm91dCB0byBmcmVlIHRoZSB1bmRlcmx5aW5nIG1l
bW9yeS4gSW4gdGhpcyBjYXNlIEknZCBwcmVmZXIgdG8KPiA+PiByZXRhaW4gdGhlIGNvbnN0LCBi
dXQgSSB3b24ndCBpbnNpc3QgYXMgdGhlIHN5bWJvbCBpcyBub24tY29uc3QgcmlnaHQKPiA+PiBu
b3cgYXMgd2VsbC4KPiA+Cj4gPkkgdGhpbmsgaWYgeW91IGRvIHRoaXMKPiA+ZXh0ZXJuIGNvbnN0
IHN0cnVjdCBibGFoIGJsYWhfc3RhcnRbXTsKPiA+aXQgaXMgbm90IHNhZmUgdG8gY2FzdCB0aGUg
Y29uc3QgYXdheSBsYXRlci4KLi4uCj4gSXQgbG9va3MgdG8gbWUgYXMgaWYgd2Ugd2VyZSBpbiBh
Z3JlZW1lbnQgdGhlbi4KClBlcmhhcHMgc28uCgo+IEkgd2FzIHRhbGtpbmcgYWJvdXQgZnJlZWlu
ZyBhbiBvYmplY3QgdGhhdCB3YXMgY29uc3QtcXVhbGlmaWVkLCBub3QKPiBtb2RpZnlpbmcgaXQu
CgpJJ20gbm90IHN1cmUgd2hhdCB5b3UgbWVhbiwgcHJlY2lzZWx5LiAgRG8geW91IG1lYW4gdGhp
czoKCiAgIGV4dGVybiBjb25zdCBzdHJ1Y3QgYmxhaCBibGFoX3N0YXJ0W107CiAgIC4uLgogICBm
cmVlKGJsYWhfc3RhcnQpOwoKPyAgQnV0IEknbSBzdXJlIHRoZSBoeXBlcnZpc29yIGRvZXNuJ3Qg
aGF2ZSBhIGZ1bmN0aW9uIGZyZWUoKS4KCj4gVGhlIHNjcnViYmluZyBvZiB0aGUgbWVtb3J5IGNv
dWxkIGJlIGNvbnNpZGVyZWQgcGFydAo+IG9mIHRoZSBmcmVlaW5nLCBpdCBqdXN0IG91Z2h0IHRv
IG9jY3VyIHVwIGZyb250IGJlY2F1c2Ugb2Ygb3RoZXJ3aXNlCj4gcG9zc2libGUgcmFjZXMsIGFu
ZCBiZWNhdXNlIHdlIGhhdmUgbm8gbWVhbnMgdG8gdGVsbCB0aGUgZnJlZWluZwo+IGZ1bmN0aW9u
IHRvIGRvIHRoZSBzY3J1YmJpbmcgKGluIGZhY3QgSSBzaG91bGQgc2F5ICJ3ZSB1c2VkIHRvIGhh
dmUKPiBubyBtZWFucywgYXMgSSB0aGluayByaWdodCBub3cgdGhlIG1lbW9yeSB3b3VsZCBiZSBz
Y3J1YmJlZAo+IGltcGxpY2l0bHksIHNvIHRoZSBleHBsaWNpdCBzY3J1YmJpbmcgY291bGQgcHJv
YmFibHkgYmUgZHJvcHBlZCkuCgpNYXliZSB5b3UgbWVhbiB0aGlzOgoKICAgZXh0ZXJuIGNvbnN0
IHN0cnVjdCBibGFoIGJsYWhfc3RhcnRbXTsKICAgLi4uCiAgIG1lbXNldChibGFoX3N0YXJ0LCAw
LCBzaXplIG9mIGJsYWggYXJyYXkpOwoKPyAgVGhhdCBpcyBjbGVhcmx5IGZvcmJpZGRlbiwgcmVn
YXJkbGVzcyBvZiB3aGV0aGVyIHRoZSBjb3N0CmlzIGNhc3QgYXdheS4gIEJ1dCBJIHRoaW5rIHRo
aXM6CgogICBleHRlcm4gc3RydWN0IGJsYWggYmxhaF9zdGFydFtdOwogICAuLi4KICAgbWVtc2V0
KGJsYWhfc3RhcnQsIDAsIHNpemUgb2YgYmxhaCBhcnJheSk7CgppcyBmaW5lLgoKSWFuLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
