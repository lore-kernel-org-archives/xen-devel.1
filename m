From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 02/12] Makefile: build and use new DSDT
 table for Q35
Date: Mon, 19 Mar 2018 07:07:34 -0600
Message-ID: <5AAFC42602000078001B36D1@prv-mh.provo.novell.com>
References: <cover.1520867740.git.x1917x@gmail.com><cover.1520867740.git.x1917x@gmail.com>
 <63cd205c8eb8b48f0609ae35dcdc246426a2371e.1520867740.git.x1917x@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=eu9s=gj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1exuVp-0007qX-EP
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 13:07:41 +0000
In-Reply-To: <63cd205c8eb8b48f0609ae35dcdc246426a2371e.1520867740.git.x1917x@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey Gerasimenko <x1917x@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAzLjE4IGF0IDE5OjMzLCA8eDE5MTd4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gLS0t
IGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL01ha2VmaWxlCj4gKysrIGIvdG9vbHMvZmlybXdh
cmUvaHZtbG9hZGVyL01ha2VmaWxlCj4gQEAgLTc1LDcgKzc1LDcgQEAgcm9tYmlvcy5vOiByb21z
LmluYwo+ICBzbWJpb3MubzogQ0ZMQUdTICs9IC1EX19TTUJJT1NfREFURV9fPSJcIiQoU01CSU9T
X1JFTF9EQVRFKVwiIgo+ICAKPiAgQUNQSV9QQVRIID0gLi4vLi4vbGliYWNwaQo+IC1EU0RUX0ZJ
TEVTID0gZHNkdF9hbnljcHUuYyBkc2R0XzE1Y3B1LmMgZHNkdF9hbnljcHVfcWVtdV94ZW4uYwo+
ICtEU0RUX0ZJTEVTID0gZHNkdF9hbnljcHUuYyBkc2R0XzE1Y3B1LmMgZHNkdF9hbnljcHVfcWVt
dV94ZW4uYyBkc2R0X3EzNV9hbnljcHVfcWVtdV94ZW4uYwoKVW5sZXNzIHlvdSBpbnRlbmQgdG8g
YWRkIGEgc2Vjb25kIGZsYXZvciwgcGxlYXNlIG9taXQgdGhlICJhbnljcHUiCnBhcnQgZnJvbSB0
aGUgbmFtZSBvZiB0aGUgbmV3IGluc3RhbmNlLgoKPiBAQCAtNTYsNiArNTYsMTMgQEAgJChBQ1BJ
X0JVSUxEX0RJUikvZHNkdF9hbnljcHVfcWVtdV94ZW4uYXNsOiBkc2R0LmFzbCBkc2R0X2FjcGlf
aW5mby5hc2wgJChNS19EU0QKPiAgCSQoTUtfRFNEVCkgLS1kZWJ1Zz0kKGRlYnVnKSAtLWRtLXZl
cnNpb24gcWVtdS14ZW4gPj4gJEAuJChUTVBfU1VGRklYKQo+ICAJbXYgLWYgJEAuJChUTVBfU1VG
RklYKSAkQAo+ICAKPiArJChBQ1BJX0JVSUxEX0RJUikvZHNkdF9xMzVfYW55Y3B1X3FlbXVfeGVu
LmFzbDogZHNkdF9xMzUuYXNsIGRzZHRfYWNwaV9pbmZvLmFzbCAkKE1LX0RTRFQpCj4gKwkjIFJl
bW92ZSBsYXN0IGJyYWNrZXQKPiArCWF3ayAnTlIgPiAxIHtwcmludCBzfSB7cz0kJDB9JyAkPCA+
ICRALiQoVE1QX1NVRkZJWCkKPiArCWNhdCBkc2R0X2FjcGlfaW5mby5hc2wgPj4gJEAuJChUTVBf
U1VGRklYKQo+ICsJJChNS19EU0RUKSAtLWRlYnVnPSQoZGVidWcpIC0tZG0tdmVyc2lvbiBxZW11
LXhlbiA+PiAkQC4kKFRNUF9TVUZGSVgpCj4gKwltdiAtZiAkQC4kKFRNUF9TVUZGSVgpICRACgpU
aGUgY29tbWFuZHMgbG9vayB0byBiZSBleGFjdGx5IHRoZSBzYW1lIGFzIHRob3NlIGZvcgpkc2R0
X2FueWNwdV9xZW11X3hlbi5hc2wgLSBwbGVhc2UgbGV0J3Mgbm90IGR1cGxpY2F0ZSBzdWNoCnRo
aW5ncywgYnV0IGluc3RlYWQgdXNlIGEgcGF0dGVybiBydWxlLgoKSmFuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
