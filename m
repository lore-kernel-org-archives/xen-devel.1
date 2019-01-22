From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 2/3] xen/dom0: Deprecate
 iommu_hwdom_inclusive and leave it disabled by default
Date: Tue, 22 Jan 2019 08:58:17 +0100
Message-ID: <20190122075817.7cxupp3ozwegk4ed@mac>
References: <1548097346-24534-1-git-send-email-andrew.cooper3@citrix.com>
 <1548097346-24534-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1548097346-24534-3-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMDc6MDI6MjVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGlzIG9wdGlvbiBpcyB1bmlxdWUgdG8geDg2IFBWIGRvbTAncywgYnV0IGl0IGlz
IG5vdCBzZW5zaWJsZSB0byBoYXZlIGEKPiBjYXRjaC1hbGwgd2hpY2ggYmxpbmRseSBtYXBzIGFs
bCBub24tUkFNIHJlZ2lvbnMgaW50byB0aGUgSU9NTVUuCj4gCj4gVGhlIG1hcC1yZXNlcnZlZCBv
cHRpb24gcmVtYWlucywgYW5kIGNvdmVycyBhbGwgdGhlIGJ1Z2d5IGZpcm13YXJlIGlzc3VlcyB0
aGF0Cj4gSSBhbSBhd2FyZSBvZi4gIFRoZSB0d28gY29tbW9uIGNhc2VzIGFyZSBsZWdhY3kgVVNC
IGtleWJvYXJkIGVtdWxhdGlvbiwgYW5kCj4gdGhlIEJNQyBtYWlsYm94IHVzZWQgYnkgdmVuZG9y
IGZpcm13YXJlIGluIE5JQ3MvSEJBcyB0byByZXBvcnQgaW5mb3JtYXRpb24KPiBiYWNrIHRvIHRo
ZSBpTE8vaURSQUMvZXRjIGZvciByZW1vdGUgcmVtb3RlIG1hbmFnZW1lbnQgcHVycG9zZXMuCj4g
Cj4gQSBzcGVjaWZpYyBhZHZhbnRhZ2Ugb2YgdGhpcyBjaGFuZ2UgaXMgdGhhdCB4ODYgZG9tMCdz
IElPTU1VIHNldHVwIGlzIG5vdwo+IGNvbnNpc3RlbnQgYmV0d2VlbiBQViBhbmQgUFZILgo+IAo+
IFRoaXMgY2hhbmdlIGlzIG5vdCBleHBlY3RlZCB0byBoYXZlIGFueSBpbXBhY3QsIGR1ZSB0byBt
YXAtcmVzZXJ2ZWQgcmVtYWluaW5nLgo+IEluIHRoZSB1bmxpa2VseSBjYXNlIHRoYXQgaXQgZG9l
cyBjYXVzZSBhbiBpc3N1ZSwgd2Ugc2hvdWxkIGludHJvZHVjZSBvdGhlcgo+IG1hcC0kU1BFQ0lG
SUMgb3B0aW9ucyByYXRoZXIgdGhhbiByZS1pbnRyb2R1Y2luZyB0aGlzIGNhdGNoLWFsbC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCldpbGwg
aXQgYmUgd29ydGggcHJpbnRpbmcgYSB3YXJuaW5nIG1lc3NhZ2UgaW4gYXJjaF9pb21tdV9od2Rv
bV9pbml0CmFib3V0IG1hcC1pbmNsdXNpdmUgZGVwcmVjYXRpb24gaWYgaXQncyBlbmFibGVkPwoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
