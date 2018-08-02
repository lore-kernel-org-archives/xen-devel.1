From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] x86/vmx: Avoid hitting BUG_ON() after
 EPTP-related domain_crash()
Date: Thu, 2 Aug 2018 07:14:56 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912914CC@SHSMSX101.ccr.corp.intel.com>
References: <1533125256-4141-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1533125256-4141-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0K
PiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxLCAyMDE4IDg6MDggUE0KPiAKPiBJZiB0aGUgRVBU
UCBwb2ludGVyIGNhbid0IGJlIGxvY2F0ZWQgaW4gdGhlIGFsdHAybSBsaXN0LCB0aGUgZG9tYWlu
Cj4gaXMgKGxlZ2l0aW1hdGVseSkgY3Jhc2hlZC4KPiAKPiBVbmRlciB0aG9zZSBjaXJjdW1zdGFu
Y2VzLCBleGVjdXRpb24gd2lsbCBjb250aW51ZSBhbmQgZ3VhcmVudGVlIHRvIGhpdAo+IHRoZQo+
IEJVR19PTihpZHggPj0gTUFYX0FMVFAyTSkgKHVuZm9ydHVuYXRlbHksIGp1c3Qgb3V0IG9mIGNv
bnRleHQpLgo+IAo+IFJldHVybiBmcm9tIHZteF92bWV4aXRfaGFuZGxlcigpIGFmdGVyIHRoZSBk
b21haW5fY3Jhc2goKSwgd2hpY2ggYWxzbwo+IGhhcyB0aGUKPiBzaWRlIGVmZmVjdCBvZiByZWVu
dGVyaW5nIHRoZSBzY2hlZHVsZXIgbW9yZSBwcm9tcHRseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEtldmlu
IFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
