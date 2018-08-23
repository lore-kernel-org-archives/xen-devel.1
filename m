From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v1 6/6] xsm: add tee access policy support
Date: Thu, 23 Aug 2018 15:08:13 +0100
Message-ID: <8fc6c862-c9bc-933b-1e56-913af1792bd2@arm.com>
References: <1534947094-9974-1-git-send-email-volodymyr_babchuk@epam.com>
 <1534947094-9974-7-git-send-email-volodymyr_babchuk@epam.com>
 <58a8d383-6a8f-442a-2611-0f8dfa053941@arm.com>
 <6165364e-f6ed-01e9-5106-b731362e6d3a@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <6165364e-f6ed-01e9-5106-b731362e6d3a@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, xen-devel@lists.xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOC8yMy8yMDE4IDAyOjU3IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBIaSBK
dWxpZW4sCgpIaSBWb2xvZHlteXIsCgoKPiBPbiAyMy4wOC4xOCAxNjo0MywgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+IAo+Pgo+PiBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCB1c2UgWFNNIHRvIGVuZm9y
Y2UgdGhlIHVzZSBvZiBURUUuIFRoaXMgCj4+IGNvbnRyYWRpY3RvcnkgdG8geW91ciBuZXh0IHBh
dGNoIHdoZXJlIHlvdSBsZXQgdGhlIHVzZXIgY29uZmlndXJlIAo+PiBPUC1URUUgZm9yIGEgZ2l2
ZW4gZ3Vlc3QuCj4+Cj4+IElITU8sIFhTTSBzaG91bGQgb25seSBiZSB1c2VkIHRvIHJlc3RyaWN0
IHVzYWdlIG9mIGNhbGxzIGluIGEgZmluZSAKPj4gZ3JhaW4uIEZvciBhbiBvdmVyYWxsIGNvbnRy
b2wsIHRoYXQgc2hvdWxkIGJlIGdvIHRocm91Z2ggYSBET01DVEwgdGVsbCAKPj4gWGVuIHRvIGlu
aXRpYWxpemUgT1AtVEVFIGZvciB0aGF0IGRvbWFpbi4KPiAKPiBKdXN0IHRvIGJlIHN1cmUuIFlv
dSBhcmUgcHJvcG9zaW5nIHRvIGFkZCBmbGFnICJURUVfRU5BQkxFRCIgZm9yIGEgCj4gZG9tYWlu
IGFuZCBzZXQgaXQgZHVyaW5nIGRvbWFpbiBjb25zdHJ1Y3Rpb24sIGJhc2VkIG9uIGNvbmZpZ3Vy
YXRpb24sIAo+IHJpZ2h0PwoKSSBhbSBzdWdnZXN0aW5nIGFub3RoZXIgZmllbGQgeGVuX2FyY2hf
ZG9tYWluY29uZmlnIHRvIHRlbGwgd2hldGhlciBURUUgCm5lZWRzIHRvIGJlIGVuYWJsZWQuCgo+
IAo+IFdoYXQgZGlkIHlvdSBtZWFuIGJ5ICJmaW5lIGdyYWluIj8KClhTTSBpcyBtb3N0bHkgdXNl
ZCB0byBkZWNpZGVkIHdoZXRoZXIgYSBnaXZlbiBoeXBlcmNhbGwgY2FuIGJlIHVzZWQgYnkgYSAK
ZG9tYWluLiBIZXJlIHlvdSB1c2UgaXQgdG8gdGVsbCB3aGV0aGVyIHRoZSB3aG9sZSBURUUgY2Fu
IGJlIHVzZWQgZm9yIGEgCmRvbWFpbi4KCllvdSBwcm9iYWJseSBkb24ndCBuZWVkIGFueSBYU00g
Zm9yIHlvdXIgdXNlIGNhc2UgaGVyZSBhcyB5b3Ugd2FudCB0aGUgCmd1ZXN0IHRvIGFjY2Vzcywg
aWYgZW5hYmxlZCwgYWxsIHRoZSBPUC1URUUgY2FsbHMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
