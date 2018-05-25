From: Julien Grall <julien.grall@arm.com>
Subject: Re: [OSSTEST PATCH] ap-common: Switch to Linux 4.14 by
 default on X86.
Date: Fri, 25 May 2018 16:08:14 +0100
Message-ID: <6e3224e2-e913-4e89-ec01-13e3e1956202@arm.com>
References: <1527259493-6383-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jndo=im=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fMEKK-0005jw-Ul
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 15:08:20 +0000
In-Reply-To: <1527259493-6383-1-git-send-email-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@linaro.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSWFuLAoKV291bGQgaXQgYmUgcG9zc2libGUgdG8gdXBkYXRlIHlvdXIgQ0Mgd2l0aCBteSBB
cm0gZS1tYWlsIGZyb20gbm93IG9uPwoKT24gMjUvMDUvMTggMTU6NDQsIElhbiBKYWNrc29uIHdy
b3RlOgo+IExpbnV4IDQuOSBpcyBnZXR0aW5nIGEgYml0IGxvbmcgaW4gdGhlIHRvb3RoLiAgNC4x
NCBpcyBhbiBMVFMgYnJhbmNoCj4gYW5kIHRoZSBvc3N0ZXN0LXRlc3RlZCB2ZXJzaW9uIHNlZW1z
IHJlYXNvbmFibHkgZ29vZC4gIEkgcmFuIGEgc3BlY2lhbAo+IHJlcG9ydFsxXSB0byBzZWUgd2hh
dCB0byBleHBlY3QgYW5kIGl0IHJlcG9ydGVkIG5vIHJlZ3Jlc3Npb25zLgo+IAo+IEFjY29yZGlu
Z2x5IEkgYW0gZ29pbmcgdG8gc3dpdGNoIHRvIHVzaW5nIExpbnV4IDQuMTQgYnkgZGVmYXVsdCBm
b3IKPiBtb3N0IFg4NiBydW5zIGluIG9zc3Rlc3QuICBBUk0gdGVzdHMgYXJlIG5vdCBhZmZlY3Rl
ZCBhdCB0aGlzIHRpbWU7Cj4gdGhleSB1c2UgdGhlaXIgb3duIGxpbnV4LWFybS14ZW4gYnJhbmNo
IHdoaWNoIGlzIHVwZGF0ZWQgYnkgdGhlIFhlbgo+IEFSTSBtYWludGFpbmVycy4KCkZXSVcsIGxp
bnV4LWFybS14ZW4gYnJhbmNoIGlzIHVzaW5nIDQuMTQuOS4gSSBoYWQgdG8gdXBncmFkZSBpdCBp
biBvcmRlciAKdG8gc3VwcG9ydCByb2NoZXN0ZXIwL3JvY2hlc3RlcjEuCgpDaGVlcnMsCgo+IAo+
IFsxXSAuL3NnLXJlcG9ydC1mbGlnaHQgLS10aGF0LWxpbnV4PTZiYTg5YjUyYmE2OTE2YmM3YTNk
MzkwZDcwOTUxZTk5MmMwY2EzOWUgLS10aGlzLWxpbnV4PWQ4ODcwMGY3OTQ0OGZjOGYwMzYxN2Q0
ZjE5MjljMzk2NzZmOGQxZTQgLS1icmFuY2hlcy1hbHNvPWxpbnV4LTQuOSxsaW51eC00LjE0LGxp
bnV4LWFybS14ZW4gMTIyOTc0IHxsZXNzCj4gCj4gQ0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IEND
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8u
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXgu
Y29tPgo+IC0tLQo+ICAgYXAtY29tbW9uIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FwLWNvbW1vbiBiL2Fw
LWNvbW1vbgo+IGluZGV4IGVjNmUwMTAuLjVlN2NmZGUgMTAwNjQ0Cj4gLS0tIGEvYXAtY29tbW9u
Cj4gKysrIGIvYXAtY29tbW9uCj4gQEAgLTYxLDcgKzYxLDcgQEAKPiAgIAo+ICAgOiAke1BVU0hf
VFJFRV9MSU5VWDo9JFhFTkJJVFM6L2hvbWUveGVuL2dpdC9saW51eC1wdm9wcy5naXR9Cj4gICA6
ICR7QkFTRV9UUkVFX0xJTlVYOj1naXQ6Ly94ZW5iaXRzLnhlbi5vcmcvbGludXgtcHZvcHMuZ2l0
fQo+IC06ICR7QkFTRV9UQUdfTElOVVg6PXRlc3RlZC9saW51eC00Ljl9Cj4gKzogJHtCQVNFX1RB
R19MSU5VWDo9dGVzdGVkL2xpbnV4LTQuMTR9Cj4gICA6ICR7QkFTRV9UQUdfTElOVVhfQVJNOj10
ZXN0ZWQvbGludXgtYXJtLXhlbn0KPiAgIAo+ICAgaWYgWyAieCR7VFJFRV9MSU5VWH0iID0geCBd
OyB0aGVuCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
