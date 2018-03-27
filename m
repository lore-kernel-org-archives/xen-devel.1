From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC 4/4] HACK libxl_exec: Check QEMU status via
 QMP instead of xenstore
Date: Tue, 27 Mar 2018 18:58:26 +0100
Message-ID: <20180327175826.GG2208@perard>
References: <20180326183401.17249-1-anthony.perard@citrix.com>
 <20180326183401.17249-5-anthony.perard@citrix.com>
 <23226.7824.260388.684497@mariner.uk.xensource.com>
 <20180327111303.GA5743@perard>
 <23226.19066.774399.262624@mariner.uk.xensource.com>
 <20180327142054.GE2208@perard>
 <23226.22973.741253.350174@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sg2s=gr=citrix.com=prvs=61706adb2=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1f0ssi-0002oT-Hy
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 17:59:36 +0000
Content-Disposition: inline
In-Reply-To: <23226.22973.741253.350174@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDM6NDg6MjlQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtSRkMgNC80XSBI
QUNLIGxpYnhsX2V4ZWM6IENoZWNrIFFFTVUgc3RhdHVzIHZpYSBRTVAgaW5zdGVhZCBvZiB4ZW5z
dG9yZSIpOgo+ID4gT24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDI6NDM6MjJQTSArMDEwMCwgSWFu
IEphY2tzb24gd3JvdGU6Cj4gPiA+IFJpZ2h0LCBidXQgZG9lc24ndCBvbmUgc3RpbGwgaGF2ZSB0
byBwb2xsIG9uIGNvbm5lY3QoKSA/Cj4gPiAKPiA+IFllcywgd2UgbmVlZCB0byBwb2xsIG9uIGNv
bm5lY3QoKS4KPiA+IAo+ID4gbGlidmlydCB0aG9zZSBpdCBhbHNvIHRvIG9wZW4gdGhlIHNvY2tl
dDoKPiA+IGh0dHBzOi8vbGlidmlydC5vcmcvZ2l0Lz9wPWxpYnZpcnQuZ2l0O2E9YmxvYjtmPXNy
Yy9xZW11L3FlbXVfbW9uaXRvci5jO2g9ZTE2OTU1M2I3ZTE3ODFkYTMwN2RkYjBiZTIzZmVkNTU0
MGJhZjM2YztoYj1IRUFEI2wzNzUKPiAKPiBVcmdoLiAgTWF5YmUgd2UgY291bGQgZml4IHRoaXMg
aW4gcWVtdSwgb3IgZG8gc29tZSBraW5kIG9mIGhhY2suCj4gCj4gRm9yIGV4YW1wbGUsIG1heWJl
IHdlIGNvdWxkIGluc3RydWN0IHFlbXUgdG8gb3BlbiBzb21lIGZpbGUgb3Igb3RoZXIsCj4gd2hp
Y2ggaXMgYWN0dWFsbHkgYSBwaXBlLiAgSWYgaXQgd291bGQgaGFwcGVuIGxhdGUgZW5vdWdodCAo
YWZ0ZXIgdGhlCj4gcW1wIHNvY2tldCBpcyBzZXQgdXApLgoKSSB0aGluayB0aGF0IGNhbiBiZSBk
b25lLgoKSWYgd2UgYWRkIHNvbWV0aGluZyBsaWtlOgonLWNoYXJkZXYnLCdwaXBlLGlkPWlub3Rp
ZnkscGF0aD0vdG1wL3BpcGUnLAonLW1vbicsJ2NoYXJkZXY9aW5vdGlmeSxtb2RlPWNvbnRyb2wn
LAoKQW5kIHdlIGp1c3QgbmVlZHMgdG8gd2FpdCB1bnRpbCBxZW11IHdyaXRlIHRoZSBRTVAgZ3Jl
YXRpbmcgaW50byB0aGUKcGlwZS4gQXQgdGhpcyBwb2ludCwgdGhlIHNvY2tldCB3ZSBjYXJlZCBm
b3IgZXhpc3QuCgpUaGF0IC90bXAvcGlwZSBjYW4gYWN0dWFsbHkgYmUgYSBmZCwgSSBkaWQgbm90
IHRlc3QgaXQsIG9ubHkgcmVhZCB0aGUKY29kZToKJy1hZGQtZmQnLCdmZD1mZCxzZXQ9MScsCict
Y2hhcmRldicsJ3BpcGUsaWQ9aW5vdGlmeSxwYXRoPS9kZXYvZmRzZXQvMScsCgpJIGp1c3QgbmVl
ZCB0byB3cml0ZSBzb21lIGNvZGUgaW4gbGlieGwgbm93LgoKLS0gCkFudGhvbnkgUEVSQVJECgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
