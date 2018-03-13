From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/xl: fix uninitialized variable in
	xl_vdispl
Date: Tue, 13 Mar 2018 14:18:06 +0000
Message-ID: <20180313141806.uhtydfzpao2iugyx@citrix.com>
References: <20180313044333.27923-1-cardoe@cardoe.com>
 <075cc346-6a37-4ee7-6f23-74f2f95ebcd2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <075cc346-6a37-4ee7-6f23-74f2f95ebcd2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Oleksandr Grytsov <oleksandr_grytsov@epam.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMTA6NTY6MzVBTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiAwMy8xMy8yMDE4IDA0OjQzIEFNLCBEb3VnIEdvbGRzdGVpbiB3cm90ZToKPiA+
IFRoZSBjb2RlIGFkZGVkIGluIDdhNDg2MjJhNzhhMGI0NTJlOGFmYTU1Yjg0NDJjOTU4YWJkMjI2
YTcgY291bGQgdXNlIHJjCj4gPiB1bmluaXRpYWxpemVkIGluIG1haW5fdmRpc3BsYXR0YWNoKCku
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNv
bT4KPiAKPiBJdCBsb29rcyBsaWtlIHRoYXQgd2FzIGRlc2lnbmVkIG9uIHB1cnBvc2UgdG8gdXNl
IHRoZSB1bmluaXRpYWxpemVkCj4gd2FybmluZ3MgdG8gY2F0Y2ggcGF0aHMgd2hlcmUgdGhlIHJj
IHdhc24ndCBzcGVjaWZpY2FsbHkgc2V0Lgo+IAo+IFRoZSBvbmx5IHBhdGggd2hlcmUgaXQncyBu
b3Qgc2V0IGlzIGlmIGRyeXJ1bl9vbmx5IGlzIHRydWU7IGFuZCBpbiB0aGF0Cj4gY2FzZSwgd2Ug
cHJvYmFibHkgYWN0dWFsbHkgd2FudCBpdCB0byBzdWNjZWVkLCBub3QgZmFpbC4KPiAKPiBObyBt
YXR0ZXIgd2hhdCwgcmMgPSAwIHNob3VsZCBiZSBhZGRlZCB0byB0aGUgZHJ5cnVuX29ubHkgcGF0
aC4gIElmIHdlCj4gd2FudCB0byBtYWtlIEVSUk9SX0ZBSUwgdGhlIGRlZmF1bHQsIHRoZW4gdGhl
IHZhcmlvdXMgcGxhY2VzIHJjIGlzIHNldAo+IHRvIEVSUk9SX0ZBSUwgc2hvdWxkIGJlIHJlbW92
ZWQuCgpZZWFoLCBDT0RJTkdfU1RZTEUgZGljdGF0ZXMgcmMgdG8gbm90IGJlIGluaXRpYWxpc2Vk
LgoKU2V0dGluZyByYyA9IDAgaW4gdGhlIGFwcHJvcHJpYXRlIHBsYWNlIGlzIHRoZSByaWdodCBz
b2x1dGlvbi4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
