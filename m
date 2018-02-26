From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/5] x86/pv: Avoid leaking other guests'
 MSR_TSC_AUX values into PV context
Date: Mon, 26 Feb 2018 14:52:08 -0500
Message-ID: <1bb81ac5-7ec2-c71f-0922-aa3f04204d9d@oracle.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjAvMjAxOCAwNjo1OCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJZiB0aGUgQ1BV
IHBpcGVsaW5lIHN1cHBvcnRzIFJEVFNDUCBvciBSRFBJRCwgYSBndWVzdCBjYW4gb2JzZXJ2ZSB0
aGUgdmFsdWUgaW4KPiBNU1JfVFNDX0FVWCwgaXJyZXNwZWN0aXZlIG9mIHdoZXRoZXIgdGhlIHJl
bGV2YW50IENQVUlEIGZlYXR1cmVzIGFyZQo+IGFkdmVydGlzZWQvaGlkZGVuLgo+Cj4gQXQgdGhl
IG1vbWVudCwgcGFyYXZpcnRfY3R4dF9zd2l0Y2hfdG8oKSBvbmx5IHdyaXRlcyB0byBNU1JfVFND
X0FVWCBpZgo+IFRTQ19NT0RFX1BWUkRUU0NQIG1vZGUgaXMgZW5hYmxlZCwgYnV0IHRoaXMgaXMg
bm90IHRoZSBkZWZhdWx0IG1vZGUuCj4gVGhlcmVmb3JlLCBkZWZhdWx0IFBWIGd1ZXN0cyBjYW4g
cmVhZCB0aGUgdmFsdWUgZnJvbSBhIHByZXZpb3VzbHkgc2NoZWR1bGVkCj4gSFZNIHZjcHUsIG9y
IFRTQ19NT0RFX1BWUkRUU0NQLWVuYWJsZWQgUFYgZ3Vlc3QuCj4KPiBBbHRlciB0aGUgUFYgcGF0
aCB0byBhbHdheXMgd3JpdGUgdG8gTVNSX1RTQ19BVVgsIHVzaW5nIDAgaW4gdGhlIGNvbW1vbiBj
YXNlLgo+Cj4gVG8gYW1vcnRpc2Ugb3ZlcmhlYWQgY29zdCwgaW50cm9kdWNlIHdybXNyX3RzY19h
dXgoKSB3aGljaCBwZXJmb3JtcyBhIGxhenkKPiB1cGRhdGUgb2YgdGhlIE1TUiwgYW5kIHVzZSB0
aGlzIGZ1bmN0aW9uIGNvbnNpc3RlbnRseSBhY3Jvc3MgdGhlIGNvZGViYXNlLgo+Cj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0K
PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBKdW4gTmFrYWppbWEg
PGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4gQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPgo+IENDOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29t
Pgo+IENDOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQu
Y29tPgo+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxr
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgooQXBvbG9naWVzIGZvciB0aGUgZGVsYXkuIEkg
YW0gcXVpdGUgYmVoaW5kIHdpdGggbXkgZW1haWxzKQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
