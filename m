From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/1] Update TXT maintainter
Date: Fri, 15 Mar 2019 11:06:45 +0000
Message-ID: <20190315110645.glc4fkv5x6nhvy4p@zion.uk.xensource.com>
References: <cover.1552379750.git.lukasz.hawrylko@intel.com>
 <129fd12dfea45b7c051fb19359cffd0db204591e.1552379750.git.lukasz.hawrylko@intel.com>
 <20190312115403.lo6brfzadf22ccz5@zion.uk.xensource.com>
 <681e8dad-0269-685f-6045-9aa9904349dd@arm.com>
 <20190315105807.mjiofcst7ma5ebnb@zion.uk.xensource.com>
 <7bbe1c7a-e613-c55e-3730-9934b12f2f1a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1zYA=RS=citrix.com=prvs=9700dc273=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h4kfp-0001t7-NP
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 11:06:49 +0000
Content-Disposition: inline
In-Reply-To: <7bbe1c7a-e613-c55e-3730-9934b12f2f1a@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, shane.wang@intel.com, "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, "tim@xen.org" <tim@xen.org>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "Hawrylko,
 Lukasz" <lukasz.hawrylko@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, gang.wei@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMTE6MDE6MDRBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFdlaSwKPiAKPiBPbiAxNS8wMy8yMDE5IDEwOjU4LCBXZWkgTGl1IHdyb3RlOgo+
ID4gT24gVGh1LCBNYXIgMTQsIDIwMTkgYXQgMDY6MjU6NDJQTSArMDAwMCwgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+ID4gPiBIaSBXZWksCj4gPiA+IAo+ID4gPiBPbiAzLzEyLzE5IDExOjU0IEFNLCBX
ZWkgTGl1IHdyb3RlOgo+ID4gPiA+IFRoYW5rcy4gVGhlIGZvcm1hdCBsb29rcyBjb3JyZWN0IG5v
dy4KPiA+ID4gPiAKPiA+ID4gPiBTaGFuZSwgY2FuIHlvdSBhY2sgdGhpcyBwYXRjaD8KPiA+ID4g
Cj4gPiA+IERvIHdlIGFsc28gbmVlZCBHYW5nIFdlaSBhY2tlZC1ieSB0byBjb25maXJtIGhlIHdh
bnRzIHRvIGJlIHJlbW92ZWQ/Cj4gPiAKPiA+IEluIHRoZW9yeSB5ZXMsIGJ1dCBpZiBHYW5nIGhh
ZCBsZWZ0IEludGVsIHRoZXJlIGhlIGNvdWxkbid0IHBvc3NpYmx5Cj4gPiByZXBseSBmcm9tIGhp
cyBpbnRlbCBhZGRyZXNzLiBBbmQgdGhlcmUgd2lsbCBiZSBubyB3YXkgdG8gdmVyaWZ5IGlmIGEK
PiA+IEdhbmcgV2VpIGVtYWlsIGZyb20gYW55IG90aGVyIGFkZHJlc3MgaXMgdGhlIEdhbmcgV2Vp
IHdlJ3JlIGxvb2tpbmcgZm9yLgo+ID4gCj4gPiBTbyBpbiB0aGlzIGNhc2UsIFNoYW5lJ3MgYWNr
IHNob3VsZCBiZSBzdWZmaWNpZW50LiBPciB3ZSBjYW4gcmVseSBvbgo+ID4gYmFja2NoYW5uZWwg
dG8gdmVyaWZ5IHRoZSBjaGFuZ2UuCj4gCj4gSSBoYWQgYSBjb25maXJtYXRpb24gZnJvbSBHYW5n
IFdlaSAodmlhIGhpcyBwZXJzb25hbCBlLW1haWwgcHJvdmlkZWQgYnkKPiBTaGFuZSkuIEJ1dCBJ
IHdhc24ndCBzdXJlIHdoZXRoZXIgd2UgYWxzbyBuZWVkIGFuIG9mZmljaWFsIGNvbmZpcm1hdGlv
biBmcm9tCj4gaGltLgoKT2ggZ3JlYXQuIElmIHlvdSBoYWQgdmVyaWZpZWQgdGhlIEdhbmcgeW91
IHRhbGtlZCB0byB3YXMgdGhlIG9uZSBsaXN0ZWQKaGVyZSwgeW91IGNhbiBhc2sgaWYgaGUncyBv
a2F5IHdpdGggcmVwbHlpbmcgZXhwbGljaXRseS4KCldlaS4KCj4gCj4gQ2hlZXJzLAo+IAo+IC0t
IAo+IEp1bGllbiBHcmFsbAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
