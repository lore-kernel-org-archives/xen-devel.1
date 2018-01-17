From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/6] xen/pvshim: identity pin shim vCPUs to
	pCPUs
Date: Wed, 17 Jan 2018 11:16:09 +0000
Message-ID: <20180117111609.hlur2q5r34ld6ujf@citrix.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=s8/r=em=citrix.com=prvs=5488b24bb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eblhZ-00064N-75
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 11:16:17 +0000
Content-Disposition: inline
In-Reply-To: <20180117094814.32772-4-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTcsIDIwMTggYXQgMDk6NDg6MTFBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFNpbmNlIFZDUFVPUF97dXAvZG93bn0gYWxyZWFkeSBpZGVudGl0eSBwaW5zIHZD
UFUgaG90cGx1ZyB0byBwQ1BVCj4gaG90cGx1ZyBhbHNvIHBpbiB0aGUgdkNQVXMgdG8gdGhlIHBD
UFVzIGluIHRoZSBzY2hlZHVsZXIuIFRoaXMgcHJldmVudAoKVGhlIGRlc2NyaXB0aW9uIGlzIGEg
Yml0IGFtYmlndW91cy4gSSByZWFkIGl0IGFzICJ0aGUgc2hpbSBob3RwbHVnIGNvZGUKcGlucyB2
Y3B1IHRvIHBjcHUgd2hpbGUgZG9pbmcgVkNQVU9QX3t1cC9kb3dufSIgYnV0IGluIGZhY3QgaXQg
aXMgInRoZQpzaGltIGhvdHBsdWcgY29kZSBhc3N1bWVzIGlkZW50aXR5IG1hcHBpbmcgYmV0d2Vl
biB2Y3B1IGFuZCBwY3B1Ii4KCldpdGggdGhpcyBjbGFyaWZpZWQuCgpSZXZpZXdlZC1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCj4gdkNQVSBtaWdyYXRpb24gYW5kIHNob3VsZCBp
bXByb3ZlIHBlcmZvcm1hbmNlLgo+IAo+IFdoaWxlIHRoZXJlIGFsc28gdXNlIF9fY3B1bWFza19z
ZXRfY3B1IGluc3RlYWQgb2YgY3B1bWFza19zZXRfY3B1LAo+IHRoZXJlJ3Mgbm8gbmVlZCB0byB1
c2UgdGhlIGxvY2tlZCB2YXJpYW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Cj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IC0tLQo+IFNob3VsZCBiZSBiYWNrcG9ydGVk
IHRvIHRoZSA0LjEwLjAtc2hpbS1jb21ldCBicmFuY2guCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9k
b20wX2J1aWxkLmMgfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxk
LmMgYi94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCj4gaW5kZXggMTdjYjEyNzJjMS4uNTU1NjYw
Yjg1MyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCj4gKysrIGIveGVu
L2FyY2gveDg2L2RvbTBfYnVpbGQuYwo+IEBAIC0xNDAsOSArMTQwLDggQEAgc3RydWN0IHZjcHUg
Kl9faW5pdCBkb20wX3NldHVwX3ZjcHUoc3RydWN0IGRvbWFpbiAqZCwKPiAgICAgIHsKPiAgICAg
ICAgICBpZiAoIHB2X3NoaW0gKQo+ICAgICAgICAgIHsKPiAtCj4gLSAgICAgICAgICAgIGNwdW1h
c2tfc2V0YWxsKHYtPmNwdV9oYXJkX2FmZmluaXR5KTsKPiAtICAgICAgICAgICAgY3B1bWFza19z
ZXRhbGwodi0+Y3B1X3NvZnRfYWZmaW5pdHkpOwo+ICsgICAgICAgICAgICBfX2NwdW1hc2tfc2V0
X2NwdSh2Y3B1X2lkLCB2LT5jcHVfaGFyZF9hZmZpbml0eSk7Cj4gKyAgICAgICAgICAgIF9fY3B1
bWFza19zZXRfY3B1KHZjcHVfaWQsIHYtPmNwdV9zb2Z0X2FmZmluaXR5KTsKPiAgICAgICAgICB9
Cj4gICAgICAgICAgZWxzZQo+ICAgICAgICAgIHsKPiAtLSAKPiAyLjE1LjEKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
