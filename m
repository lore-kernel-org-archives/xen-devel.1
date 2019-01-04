From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/4] xen/dom0: Improve documentation for
 dom0= and dom0-iommu=
Date: Fri, 4 Jan 2019 13:15:28 +0100
Message-ID: <20190104121528.kgg33fma77hdzqrz@mac.bytemobile.com>
References: <1546269383-32166-1-git-send-email-andrew.cooper3@citrix.com>
 <1546269383-32166-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1546269383-32166-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMzEsIDIwMTggYXQgMDM6MTY6MjBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiArQ29udHJvbHMgZm9yIHRoZSBkb20wIElPTU1VIHNldHVwLgo+ICsKPiArKiAgIFRo
ZSBgcGFzc3Rocm91Z2hgIGJvb2xlYW4gY29udHJvbHMgd2hldGhlciBJT01NVSB0cmFuc2xhdGlv
biBmdW5jdGlvbmFsaXR5Cj4gKyAgICBpcyBkaXNhYmxlZCBmb3IgZGV2aWNlcyBpbiBkb20wIChg
cGFzc3Rocm91Z2g9MWApIG9yIHdoZXRoZXIgdGhlIElPTU1VIGlzCj4gKyAgICB1c2VkIHRvIGVu
c3VyZSB0aGF0IGRvbTAgY2FuIG9ubHkgRE1BIHRvIGl0cyBwZXJtaXR0ZWQgYXJlYXMgb2YgUkFN
Cj4gKyAgICAoYHBhc3N0aHJvdWdoPTBgKS4KPiArCj4gKyAgICBUaGlzIG9wdGlvbiBpcyBvbmx5
IGFwcGxpY2FibGUgdG8geDg2IFBWIGRvbTAncywgYW5kIGRlZmF1bHRzIHRvIGZhbHNlLgo+ICsK
PiArICAgIFNvbWUgb2xkZXIgSW50ZWwgVlQtZCBoYXJkd2FyZSBpc24ndCBjYXBhYmxlIG9mIGRp
c2FibGluZyB0cmFuc2xhdGlvbgo+ICsgICAgZnVuY3Rpb25hbGl0eSBvbiBhIHBlci1kZXZpY2Ug
YmFzaXMsIGFuZCB3aWxsIGNhdXNlIHRoaXMgb3B0aW9uIHRvIGJlCj4gKyAgICBpZ25vcmVkIGFu
ZCBhc3N1bWVkIHRvIGJlIDAuICBTaW1pbGFyIGJlaGF2aW91ciBvbiBzdWNoIHN5c3RlbXMgaXMg
b25seQo+ICsgICAgYXZhaWxhYmxlIGJ5IGZ1bGx5IGRpc2FibGluZyBhbGwgSU9NTVVzLgo+ICsK
PiArICAgIFRoaXMgb3B0aW9uIGlzIGhhcmR3aXJlZCB0byBmYWxzZSBmb3IgeDg2IFBWSCBkb20w
J3MgKHdoZXJlIGEgbm9uLWlkZW50aXR5Cj4gKyAgICB0cmFuc2Zvcm0gaXMgcmVxdWlyZWQgZm9y
IGRvbTAgdG8gZnVuY3Rpb24pLCBhbmQgaXMgaWdub3JlZCBmb3IgQVJNLgo+ICsKPiArKiAgIFRo
ZSBgc3RyaWN0YCBib29sZWFuIGlzIGFwcGxpY2FibGUgdG8geDg2IFBWIGRvbTAncyBvbmx5IGFu
ZCBkZWZhdWx0cyB0bwo+ICsgICAgZmFsc2UuICBJdCBjb250cm9scyB3aGV0aGVyIGRvbTAgY2Fu
IGhhdmUgSU9NTVUgbWFwcGluZ3MgZm9yIGFsbCBkb21haW4KCkkgd291bGQgcmVtb3ZlICdkb21h
aW4nIGZyb20gdGhlIGVuZCBvZiB0aGlzIGxpbmUuCgpXaXRoIG9yIHdpdGhvdXQgdGhhdDoKClJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
