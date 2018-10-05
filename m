From: Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH 08/18] Various: Fix typo `mappping'
Date: Fri,  5 Oct 2018 18:29:07 +0100
Message-ID: <20181005172917.11963-9-ian.jackson@citrix.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lvwj=mr=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1g8Tuv-0004Ag-C8
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 17:29:33 +0000
In-Reply-To: <20181005172917.11963-1-ian.jackson@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Hans van Kranenburg <hans@knorrie.org>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Ci0tLQog
dG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jICAgfCAyICstCiB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC92dGQvaW9tbXUuaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3B5dGhvbi94ZW4vbG93
bGV2ZWwveGMveGMuYyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYwppbmRleCBl
YmVmOTJjZDUwLi40ODRiNzkwYzc1IDEwMDY0NAotLS0gYS90b29scy9weXRob24veGVuL2xvd2xl
dmVsL3hjL3hjLmMKKysrIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jCkBAIC0y
Mzg1LDcgKzIzODUsNyBAQCBzdGF0aWMgUHlNZXRob2REZWYgcHl4Y19tZXRob2RzW10gPSB7CiAg
ICAgeyAiZG9tYWluX3NldF9tZW1tYXBfbGltaXQiLCAKICAgICAgIChQeUNGdW5jdGlvbilweXhj
X2RvbWFpbl9zZXRfbWVtbWFwX2xpbWl0LCAKICAgICAgIE1FVEhfVkFSQVJHUywgIlxuIgotICAg
ICAgIlNldCBhIGRvbWFpbidzIHBoeXNpY2FsIG1lbW9yeSBtYXBwcGluZyBsaW1pdFxuIgorICAg
ICAgIlNldCBhIGRvbWFpbidzIHBoeXNpY2FsIG1lbW9yeSBtYXBwaW5nIGxpbWl0XG4iCiAgICAg
ICAiIGRvbSBbaW50XTogSWRlbnRpZmllciBvZiBkb21haW4uXG4iCiAgICAgICAiIG1hcF9saW1p
dGtiIFtpbnRdOiAuXG4iCiAgICAgICAiUmV0dXJuczogW2ludF0gMCBvbiBzdWNjZXNzOyAtMSBv
biBlcnJvci5cbiIgfSwKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9p
b21tdS5oIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmgKaW5kZXggNDdiZGZj
YjVlYS4uMWE5OTJmNzJkNiAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2lvbW11LmgKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmgKQEAgLTUx
Myw3ICs1MTMsNyBAQCBzdHJ1Y3QgcWlfY3RybCB7CiBzdHJ1Y3QgaXJfY3RybCB7CiAgICAgdTY0
IGlyZW1hcF9tYWRkcjsgICAgICAgICAgICAvKiBpbnRlcnJ1cHQgcmVtYXAgdGFibGUgbWFjaGlu
ZSBhZGRyZXNzICovCiAgICAgaW50IGlyZW1hcF9udW07ICAgICAgICAgICAgICAvKiB0b3RhbCBu
dW0gb2YgdXNlZCBpbnRlcnJ1cHQgcmVtYXAgZW50cnkgKi8KLSAgICBzcGlubG9ja190IGlyZW1h
cF9sb2NrOyAgICAgIC8qIGxvY2sgZm9yIGlycSByZW1hcHBwaW5nIHRhYmxlICovCisgICAgc3Bp
bmxvY2tfdCBpcmVtYXBfbG9jazsgICAgICAvKiBsb2NrIGZvciBpcnEgcmVtYXBwaW5nIHRhYmxl
ICovCiB9OwogCiBzdHJ1Y3QgaW9tbXVfZmx1c2ggewotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
