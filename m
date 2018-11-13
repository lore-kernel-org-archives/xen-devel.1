From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 15/18] xen/arm: Resume memory management on
 Xen resume
Date: Tue, 13 Nov 2018 13:35:14 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811131246450.8259@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-16-git-send-email-mirela.simonovic@aggios.com>
 <65d21faa-33be-621d-050d-54de04a0e97f@arm.com>
 <alpine.DEB.2.10.1811121550210.8259@sstabellini-ThinkPad-X260>
 <17aa6668-a804-b4e5-d2eb-51a5f2d33dc5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+wyv=ny=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gMgL6-0008U7-Ko
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 21:35:16 +0000
In-Reply-To: <17aa6668-a804-b4e5-d2eb-51a5f2d33dc5@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, dm@aggios.com, saeed.nowshadi@xilinx.com, stefano.stabellini@xilinx.com, xen-devel@lists.xenproject.org, xen-devel@lists.xen.org, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxMyBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDEz
LzExLzIwMTggMDE6MzYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIE1vbiwgMTIg
Tm92IDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gT24gMTEvMTIvMTggMTE6MzAgQU0s
IE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6Cj4gPiBXZSBjYW4gdHVybiB0aGlzIGFzc2VtYmx5IGNv
ZGUgaW50byBhIC5tYWNybywgc28gdGhhdCBhdCBsZWFzdCB3aGVuIHdlCj4gPiBnZXQgYXJvdW5k
IHRvIGl0LCB3ZSBqdXN0IG5lZWQgdG8gZml4IGl0IG9uZSBwbGFjZS4gSW4gZmFjdCwgSSBub3Rp
Y2VkCj4gPiB0aGF0IHRoZSBjb2RlIHNlcXVlbmNlIHJpZ2h0IGJlZm9yZSAibW11X3Jlc3VtZWQi
IGFuZCB0aGUgb25lIHJpZ2h0Cj4gPiBhZnRlciBhcmUgYm90aCBpbmRlbnRpY2FsIHRvIHRoZSBv
bmVzIGhlYWQuUywgaXQgd291bGQgYmUgZ29vZCB0byBhdm9pZAo+ID4gdGhlIGR1cGxpY2F0aW9u
IGlmIHBvc3NpYmxlLgo+IAo+IFRoaXMgZG9lcyBub3QgYWRkcmVzcyBteSBjb25jZXJuLiBXZSB3
YW50IHRvIGhhdmUgc3VzcGVuZC9yZXN1bWUgY29tcGxpYW50IHRvCj4gdGhlIEFybSBhcmNoaXRl
Y3R1cmUgKGF0IGxlYXN0IHRvIG91ciBiZXN0IGtub3dsZWRnZSkuIEhpZGluZyBpdCBpbiBhCj4g
bWFjcm8vZnVuY3Rpb24gaXMgbm90IGdvaW5nIHRvIG1ha2UgaXQgY29tcGxpYW50Lgo+IAo+IE5v
Ym9keSB3YW50cyBpdHMgcGxhdGZvcm0gcmFuZG9tbHkgY3Jhc2hpbmcgb24gc3VzcGVuZC9yZXN1
bWUgYmVjYXVzZSB0aGUgQXJtCj4gQXJtIHdhcyBrbm93aW5nbHkgbm90IGZvbGxvd2VkLiBUaGlz
IGlzIG1vcmUgY3JpdGljYWwgdGhhbiB0aGUgYm9vdCBvbmUgYXMgd2UKPiBhcmUgZ29pbmcgdG8g
Y2FsbCB0aGF0IG1vcmUgb2Z0ZW4uIFNvIHdoYXQgaXMgdGhlIGFjdGlvbiBwbGFuIHRvIGNvcnJl
Y3RseQo+IHJlc3VtZSBtZW1vcnkgbWFuYWdlbWVudCBpbiB0aGlzIHNlcmllcz8KCk15IHN1Z2dl
c3Rpb24gZG9lcyBub3QgYWRkcmVzcyB5b3VyIGNvbmNlcm4sIGJ1dCBhdCBsZWFzdCBpdCBsaW1p
dHMgdGhlCnNwcmVhZGluZyBvZiBlcnJvcnMgY29kZS13aXNlLgoKSXQgaXMgb25seSBuYXR1cmFs
IGZvciBhIGNvbnRyaWJ1dG9yIHRvIHN0YXJ0IGZyb20gZXhpc3RpbmcgY29kZSB0bwp3cml0ZSBu
ZXcgY29kZS4gSXQganVzdCBoYXBwZW5zIHRoYXQgdGhlIGV4aXN0aW5nIGNvZGUgaXMgYnJva2Vu
LCB0aHVzLAp0aGUgbmV3IGNvZGUgaXMgYnJva2VuIHRvby4gV2UgY2FuJ3QgcmVhbGx5IGV4cGVj
dCBhbnkgZGlmZmVyZW50IDopCgpJZiB3ZSB3YW50IHRoZSBjb250cmlidXRvciB0byBmaXggdGhp
cywgZ2l2ZW4gdGhhdCB0aGUgY2hhbmdlIGlzIGEKZGlmZmljdWx0IG1vZGlmaWNhdGlvbiB0byBk
ZWxpY2F0ZSBhc3NlbWJseSBjb2RlLCB3ZSBuZWVkIHRvIHByb3ZpZGUKZGV0YWlsZWQgZG9jdW1l
bnRhdGlvbiBhbmQvb3Igc2FtcGxlIGNvZGUuIE90aGVyd2lzZSBJIGNhbid0IHNlZSBob3cgaXQK
Y2FuIGdvIHdlbGwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
