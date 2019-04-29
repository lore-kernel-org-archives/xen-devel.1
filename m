From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/arm: skip first page when RAM starts at
 0x0
Date: Mon, 29 Apr 2019 10:07:01 -0600
Message-ID: <5CC72125020000780022A20F@prv1-mh.provo.novell.com>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
 <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
 <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
 <alpine.DEB.2.10.1904261621360.24598@sstabellini-ThinkPad-X260>
 <5CC6A47E0200007800229D67@prv1-mh.provo.novell.com>
 <10687f88-fb6b-721c-c6e8-a1ab06023616@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL8o8-0003Sq-1H
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:07:08 +0000
In-Reply-To: <10687f88-fb6b-721c-c6e8-a1ab06023616@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, nd@arm.com, 206497@studenti.unimore.it, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA0LjE5IGF0IDE3OjU0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEFueXdheSwgSSBhbHNvIHRlc3RlZCB0aGUgY2hhbmdlIHN1Z2dlc3RlZCBieSBTdGVmYW5vLiBU
aGlzIHdpbGwgc3Vic3RhbnRpYWxseSAKPiBpbmNyZWFzZSB0aGUgc2l6ZSBvZiB0aGUgZnJhbWV0
YWJsZSBvbiBwbGF0Zm9ybSB3aGVyZSB0aGUgUkFNIGRvZXMgbm90IHN0YXJ0IAo+IGF0IDAuCj4g
Cj4gRm9yIGluc3RhbmNlLCBvbiBGb3VuZGF0aW9uIE1vZGVsIHRoZSBSQU0gc3RhcnRzIGF0IDJH
Qi4gQXMgd2UgZG9uJ3QgY29tcHJlc3MgCj4gYW55IG9mIHRoZSBmaXJzdCAzMSBiaXRzLCB0aGUg
ZnJhbWV0YWJsZSB3aWxsIG5vdyBiZSAyOE1CIGJpZ2dlciB0aGFuIHdlIAo+IGN1cnJlbnRseSBo
YXZlICgxMTJNQiB1cCBmcm9tIDg0TUIpLgo+IAo+IFNvIEkgdGhpbmsgd2hhdCB3ZSB3YW50IGlz
Ogo+IAo+IG5yX3BkeHMgPSBwZm5fdG9fcGR4KGVuZCAtIDEpIC0gcGZuX3RvX3BkeChzdGFydCkg
KyAxOwo+IGZyYW1lX3RhYmxlX2Jhc2VfcGR4ID0gcGZuX3RvX3BkeChzdGFydCk7CgpZZXMsIGlm
IHRoZXJlJ3Mgb25seSBhIHNpbmdsZSBtZW1vcnkgcmFuZ2UgYXQgMkdiLCB0aGVuIHN1YnRyYWN0
aW5nCnRoZSBiYXNlIGFkZHJlc3Mgd2lsbCBvZiBjb3Vyc2UgeWllbGQgYmV0dGVyIHJlc3VsdHMu
IEJ1dCBpZiB0aGVyZSBhcmUKbXVsdGlwbGUgcmVnaW9ucywgdGhpbmdzIHJlYWxseSBkZXBlbmQg
b24gdGhlIHBsYWNlbWVudCBvZiBhbGwgb2YKdGhlbS4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
