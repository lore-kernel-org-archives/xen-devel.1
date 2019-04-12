From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/tasklet: Fix return value truncation on
 arm64
Date: Fri, 12 Apr 2019 05:16:36 -0600
Message-ID: <5CB073940200007800226D98@prv1-mh.provo.novell.com>
References: <1554989127-31772-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1554989127-31772-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA0LjE5IGF0IDE1OjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIHVzZSBvZiByZXR1cm5fcmVnKCkgYXNzdW1lcyBBUk0ncyAzMmJpdCBBQkkuICBU
aGVyZWZvcmUsIGEgZmFpbHVyZSBzdWNoIGFzCj4gLUVJTlZBTCB3aWxsIGFwcGVhciBhcyBhIGxh
cmdlIHBvc2l0aXZlIG51bWJlciBuZWFyIDQgYmlsbGlvbiB0byBhIDY0Yml0IEFSTQo+IGd1ZXN0
IHdoaWNoIGhhcHBlbnMgdG8gdXNlIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoKS4KPiAKPiBJ
bnRyb2R1Y2UgYSBuZXcgYXJjaF9oeXBlcmNhbGxfdGFza2xldF9yZXN1bHQoKSBob29rIHdoaWNo
IGlzIGltcGxlbWVudGVkIGJ5Cj4gYm90aCBhcmNoaXRlY3R1cmVzLCBhbmQgZHJvcCB0aGUgcmV0
dXJuX3JlZygpIG1hY3Jvcy4gIFRoaXMgbG9naWMgd2lsbCBiZQo+IGV4dGVuZGVkIGluIGEgbGF0
ZXIgY2hhbmdlIHRvIG1ha2UgY29udGludWF0aW9ucyBvdXQgb2YgdGhlIHRhc2tsZXQgd29yay4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKT24gdGhlIGFzc3VtcHRpb24gdGhhdCBzaW1wbHkgZml4aW5nIEFybSdzIHJldHVybl9y
ZWcoKSB3b3VsZApub3Qgc3VmZmljZSB3aXRoIHlvdXIgZnVydGhlciBwbGFucwpBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
