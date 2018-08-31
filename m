From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] xen: add DEBUG_INFO Kconfig symbol
Date: Fri, 31 Aug 2018 09:32:16 +0100
Message-ID: <20180831083216.gxvhuunogisdiinx@zion.uk.xensource.com>
References: <20180831082921.11208-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ya8d=lo=citrix.com=prvs=77401f9b1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fver6-000129-5y
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 08:32:36 +0000
Content-Disposition: inline
In-Reply-To: <20180831082921.11208-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMzEsIDIwMTggYXQgMTA6Mjk6MjFBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQ3JlYXRpbmcgZGVidWcgaW5mbyBkdXJpbmcgYnVpbGQgaXMgbm90IHN0cmljdGx5IHJl
cXVpcmVkIGF0IHJ1bnRpbWUuCj4gTWFrZSBpdCBvcHRpb25hbCBieSBpbnRyb2R1Y2luZyBhIG5l
dyBLY29uZmlnIGtub2IgIkRFQlVHX0lORk8iLgo+IFRoaXMgc2xpZ2h0bHkgcmVkdWNlcyBidWls
ZCB0aW1lIGFuZCBkaXNrdXNhZ2UsIGlmIGRpc2FibGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9s
YWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KPiAtLS0KPiAgeGVuL0tjb25maWcuZGVidWcgfCA3
ICsrKysrKysKPiAgeGVuL1J1bGVzLm1rICAgICAgfCA1ICsrKystCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
S2NvbmZpZy5kZWJ1ZyBiL3hlbi9LY29uZmlnLmRlYnVnCj4gaW5kZXggMzgwYzRlOGQ3NS4uMWQ4
YzJjOTRhOSAxMDA2NDQKPiAtLS0gYS94ZW4vS2NvbmZpZy5kZWJ1Zwo+ICsrKyBiL3hlbi9LY29u
ZmlnLmRlYnVnCj4gQEAgLTExLDYgKzExLDEzIEBAIGNvbmZpZyBERUJVRwo+ICAKPiAgCSAgWW91
IHByb2JhYmx5IHdhbnQgdG8gc2F5ICdOJyBoZXJlLgo+ICAKPiArY29uZmlnIERFQlVHX0lORk8K
PiArCWJvb2wgIkNvbXBpbGUgWGVuIHdpdGggZGVidWcgaW5mbyIKPiArCWRlZmF1bHQgeQoKQXQg
dGhlIHZlcnkgbGVhc3QgdGhpcyBzaG91bGQgYmUgZGVmYXVsdCBERUJVRwoKQnV0IHdoYXQgaXMg
dGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGlzIGFuZCBERUJVRyBhbnl3YXk/CgpXZWkuCgo+ICsJ
LS0taGVscC0tLQo+ICsJICBJZiB5b3Ugc2F5IFkgaGVyZSB0aGUgcmVzdWx0aW5nIFhlbiB3aWxs
IGluY2x1ZGUgZGVidWdnaW5nIGluZm8KPiArCSAgcmVzdWx0aW5nIGluIGEgbGFyZ2VyIGJpbmFy
eSBpbWFnZS4KPiArCj4gIGlmIERFQlVHIHx8IEVYUEVSVCA9ICJ5Igo+ICAKPiAgY29uZmlnIENS
QVNIX0RFQlVHCj4gZGlmZiAtLWdpdCBhL3hlbi9SdWxlcy5tayBiL3hlbi9SdWxlcy5tawo+IGlu
ZGV4IDQ3Yzk1NDQyNWQuLjQ3YzVjNjk0ZDYgMTAwNjQ0Cj4gLS0tIGEveGVuL1J1bGVzLm1rCj4g
KysrIGIveGVuL1J1bGVzLm1rCj4gQEAgLTU1LDcgKzU1LDEwIEBAIGVuZGlmCj4gIAo+ICBDRkxB
R1MgKz0gLW5vc3RkaW5jIC1mbm8tYnVpbHRpbiAtZm5vLWNvbW1vbgo+ICBDRkxBR1MgKz0gLVdl
cnJvciAtV3JlZHVuZGFudC1kZWNscyAtV25vLXBvaW50ZXItYXJpdGgKPiAtQ0ZMQUdTICs9IC1w
aXBlIC1nIC1EX19YRU5fXyAtaW5jbHVkZSAkKEJBU0VESVIpL2luY2x1ZGUveGVuL2NvbmZpZy5o
Cj4gK2lmZXEgKCQoQ09ORklHX0RFQlVHX0lORk8pLHkpCj4gK0NGTEFHUyArPSAtZwo+ICtlbmRp
Zgo+ICtDRkxBR1MgKz0gLXBpcGUgLURfX1hFTl9fIC1pbmNsdWRlICQoQkFTRURJUikvaW5jbHVk
ZS94ZW4vY29uZmlnLmgKPiAgQ0ZMQUdTICs9ICctRF9fT0JKRUNUX0ZJTEVfXz0iJEAiJwo+ICAK
PiAgaWZuZXEgKCQoY2xhbmcpLHkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
