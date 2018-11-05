From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/vcpu: Remove struct vcpu allocation
 restriction when possible
Date: Mon, 05 Nov 2018 06:34:26 -0700
Message-ID: <5BE046E202000078001F809B@prv1-mh.provo.novell.com>
References: <1541423850-8873-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541423850-8873-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjExLjE4IGF0IDE0OjE3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlcmUgaXMgbm8gbmVlZCBmb3Igc3RydWN0IHZjcHUgdG8gbGl2ZSBiZWxvdyB0aGUg
NEcgYm91bmRhcnkgZm9yIFBWIGd1ZXN0cywKPiBvciBmb3IgSFZNIHZjcHVzIHVzaW5nIEhBUC4K
PiAKPiBQbHVtYiBzdHJ1Y3QgZG9tYWluIGludG8gYWxsb2NfdmNwdV9zdHJ1Y3QoKSBzbyB0aGUg
eDg2IHZlcnNpb24gY2FuIHF1ZXJ5IHRoZQo+IGRvbWFpbidzIHR5cGUgYW5kIHBhZ2luZyBzZXR0
aW5ncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
