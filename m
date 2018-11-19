From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH 1/9] mm: Introduce new vm_insert_range API
Date: Mon, 19 Nov 2018 20:43:09 +0530
Message-ID: <CAFqt6zbOWX5LUTWwoGDJsGdf+pTR6N1yTPVxyr1W3-6Fte39ww__7295.21543621576$1542640113$gmane$org@mail.gmail.com>
References: <20181115154530.GA27872@jordon-HP-15-Notebook-PC>
 <20181116182836.GB17088@rapoport-lnx>
 <CAFqt6zYp0j999WXw9Jus0oZMjADQQkPfso8btv6du6L9CE3PXA@mail.gmail.com>
 <20181117143742.GB7861@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181117143742.GB7861@bombadil.infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matthew Wilcox <willy@infradead.org>, rppt@linux.ibm.com
Cc: Michal Hocko <mhocko@suse.com>, Heiko Stuebner <heiko@sntech.de>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, linux1394-devel@lists.sourceforge.net, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, oleksandr_andrushchenko@epam.com, joro@8bytes.org, Russell King - ARM Linux <linux@armlinux.org.uk>, iommu@lists.linux-foundation.org, airlied@linux.ie, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, treding@nvidia.com, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, pawel@osciak.com, Rik van Riel <riel@surriel.com>, rppt@linux.vnet.ibm.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, mchehab@kernel.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz, Juergen Gross <jgross@suse.com>, hjc@rock-chips.com, xen-devel@li
List-Id: xen-devel@lists.xenproject.org

SGkgTWlrZSwKCk9uIFNhdCwgTm92IDE3LCAyMDE4IGF0IDg6MDcgUE0gTWF0dGhldyBXaWxjb3gg
PHdpbGx5QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBOb3YgMTcsIDIwMTggYXQg
MTI6MjY6MzhQTSArMDUzMCwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPiA+IE9uIEZyaSwgTm92
IDE2LCAyMDE4IGF0IDExOjU5IFBNIE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4g
d3JvdGU6Cj4gPiA+ID4gKyAqIHZtX2luc2VydF9yYW5nZSAtIGluc2VydCByYW5nZSBvZiBrZXJu
ZWwgcGFnZXMgaW50byB1c2VyIHZtYQo+ID4gPiA+ICsgKiBAdm1hOiB1c2VyIHZtYSB0byBtYXAg
dG8KPiA+ID4gPiArICogQGFkZHI6IHRhcmdldCB1c2VyIGFkZHJlc3Mgb2YgdGhpcyBwYWdlCj4g
PiA+ID4gKyAqIEBwYWdlczogcG9pbnRlciB0byBhcnJheSBvZiBzb3VyY2Uga2VybmVsIHBhZ2Vz
Cj4gPiA+ID4gKyAqIEBwYWdlX2NvdW50OiBuby4gb2YgcGFnZXMgbmVlZCB0byBpbnNlcnQgaW50
byB1c2VyIHZtYQo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBUaGlzIGFsbG93cyBkcml2ZXJzIHRv
IGluc2VydCByYW5nZSBvZiBrZXJuZWwgcGFnZXMgdGhleSd2ZSBhbGxvY2F0ZWQKPiA+ID4gPiAr
ICogaW50byBhIHVzZXIgdm1hLiBUaGlzIGlzIGEgZ2VuZXJpYyBmdW5jdGlvbiB3aGljaCBkcml2
ZXJzIGNhbiB1c2UKPiA+ID4gPiArICogcmF0aGVyIHRoYW4gdXNpbmcgdGhlaXIgb3duIHdheSBv
ZiBtYXBwaW5nIHJhbmdlIG9mIGtlcm5lbCBwYWdlcyBpbnRvCj4gPiA+ID4gKyAqIHVzZXIgdm1h
Lgo+ID4gPgo+ID4gPiBQbGVhc2UgYWRkIHRoZSByZXR1cm4gdmFsdWUgYW5kIGNvbnRleHQgZGVz
Y3JpcHRpb25zLgo+ID4gPgo+ID4KPiA+IFN1cmUgSSB3aWxsIHdhaXQgZm9yIHNvbWUgdGltZSB0
byBnZXQgYWRkaXRpb25hbCByZXZpZXcgY29tbWVudHMgYW5kCj4gPiBhZGQgYWxsIG9mIHRob3Nl
IHJlcXVlc3RlZCBjaGFuZ2VzIGluIHYyLgo+Cj4gWW91IGNvdWxkIHNlbmQgeW91ciBwcm9wb3Nl
ZCB3b3JkaW5nIG5vdyB3aGljaCBtaWdodCByZW1vdmUgdGhlIG5lZWQKPiBmb3IgYSB2MyBpZiB3
ZSBlbmQgdXAgYXJndWluZyBhYm91dCB0aGUgd29yZGluZy4KCkRvZXMgdGhpcyBkZXNjcmlwdGlv
biBsb29rcyBnb29kID8KCi8qKgogKiB2bV9pbnNlcnRfcmFuZ2UgLSBpbnNlcnQgcmFuZ2Ugb2Yg
a2VybmVsIHBhZ2VzIGludG8gdXNlciB2bWEKICogQHZtYTogdXNlciB2bWEgdG8gbWFwIHRvCiAq
IEBhZGRyOiB0YXJnZXQgdXNlciBhZGRyZXNzIG9mIHRoaXMgcGFnZQogKiBAcGFnZXM6IHBvaW50
ZXIgdG8gYXJyYXkgb2Ygc291cmNlIGtlcm5lbCBwYWdlcwogKiBAcGFnZV9jb3VudDogbnVtYmVy
IG9mIHBhZ2VzIG5lZWQgdG8gaW5zZXJ0IGludG8gdXNlciB2bWEKICoKICogVGhpcyBhbGxvd3Mg
ZHJpdmVycyB0byBpbnNlcnQgcmFuZ2Ugb2Yga2VybmVsIHBhZ2VzIHRoZXkndmUgYWxsb2NhdGVk
CiAqIGludG8gYSB1c2VyIHZtYS4gVGhpcyBpcyBhIGdlbmVyaWMgZnVuY3Rpb24gd2hpY2ggZHJp
dmVycyBjYW4gdXNlCiAqIHJhdGhlciB0aGFuIHVzaW5nIHRoZWlyIG93biB3YXkgb2YgbWFwcGlu
ZyByYW5nZSBvZiBrZXJuZWwgcGFnZXMgaW50bwogKiB1c2VyIHZtYS4KICoKICogQ29udGV4dCAt
IFByb2Nlc3MgY29udGV4dC4gQ2FsbGVkIGJ5IG1tYXAgaGFuZGxlcnMuCiAqIFJldHVybiAtIGlu
dCBlcnJvciB2YWx1ZQogKiAwICAgICAgICAgICAgICAgICAgICAtIE9LCiAqIC1FSU5WQUwgICAg
ICAgICAgICAgIC0gSW52YWxpZCBhcmd1bWVudAogKiAtRU5PTUVNICAgICAgICAgICAgICAtIE5v
IG1lbW9yeQogKiAtRUZBVUxUICAgICAgICAgICAgICAtIEJhZCBhZGRyZXNzCiAqIC1FQlVTWSAg
ICAgICAgICAgICAgIC0gRGV2aWNlIG9yIHJlc291cmNlIGJ1c3kKICovCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
