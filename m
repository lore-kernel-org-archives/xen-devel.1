From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/4] tools: xencall, xengnttab,
 xengntshr: Provide access to internal fds
Date: Mon, 14 May 2018 18:18:13 +0100
Message-ID: <34717254-6c23-6f5b-ee9f-f68896499b5b@citrix.com>
References: <1526317739-17572-1-git-send-email-ian.jackson@eu.citrix.com>
 <1526317739-17572-4-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5rcz=ib=citrix.com=prvs=665596235=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fIH73-0004Du-AF
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 17:18:17 +0000
In-Reply-To: <1526317739-17572-4-git-send-email-ian.jackson@eu.citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDUvMTggMTg6MDgsIElhbiBKYWNrc29uIHdyb3RlOgo+IGRpZmYgLS1naXQgYS90b29s
cy9saWJzL2NhbGwvbGlieGVuY2FsbC5tYXAgYi90b29scy9saWJzL2NhbGwvbGlieGVuY2FsbC5t
YXAKPiBpbmRleCAyZjk2MTQ0Li4yOTljYTM4IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnMvY2Fs
bC9saWJ4ZW5jYWxsLm1hcAo+ICsrKyBiL3Rvb2xzL2xpYnMvY2FsbC9saWJ4ZW5jYWxsLm1hcAo+
IEBAIC0yLDYgKzIsNyBAQCBWRVJTXzEuMCB7Cj4gIAlnbG9iYWw6Cj4gIAkJeGVuY2FsbF9vcGVu
Owo+ICAJCXhlbmNhbGxfY2xvc2U7Cj4gKwkJeGVuY2FsbF9mZDsKPiAgCj4gIAkJeGVuY2FsbDA7
Cj4gIAkJeGVuY2FsbDE7Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvZ250dGFiL2xpYnhlbmdu
dHRhYi5tYXAgYi90b29scy9saWJzL2dudHRhYi9saWJ4ZW5nbnR0YWIubWFwCj4gaW5kZXggZjc4
ZGEyMi4uY2U1OWVjOSAxMDA2NDQKPiAtLS0gYS90b29scy9saWJzL2dudHRhYi9saWJ4ZW5nbnR0
YWIubWFwCj4gKysrIGIvdG9vbHMvbGlicy9nbnR0YWIvbGlieGVuZ250dGFiLm1hcAo+IEBAIC0y
LDYgKzIsNyBAQCBWRVJTXzEuMCB7Cj4gIAlnbG9iYWw6Cj4gIAkJeGVuZ250dGFiX29wZW47Cj4g
IAkJeGVuZ250dGFiX2Nsb3NlOwo+ICsJCXhlbmdudHRhYl9mZDsKPiAgCj4gIAkJeGVuZ250dGFi
X3NldF9tYXhfZ3JhbnRzOwo+ICAKPiBAQCAtMTQsNiArMTUsNyBAQCBWRVJTXzEuMCB7Cj4gIAo+
ICAJCXhlbmdudHNocl9vcGVuOwo+ICAJCXhlbmdudHNocl9jbG9zZTsKPiArCQl4ZW5nbnRzaHJf
ZmQ7Cj4gIAo+ICAJCXhlbmdudHNocl9zaGFyZV9wYWdlX25vdGlmeTsKPiAgCQl4ZW5nbnRzaHJf
c2hhcmVfcGFnZXM7CgpUaGVzZSBhcmUgQUJJIGJyZWFrYWdlcy4KClRoZSBvbmx5IG1vZGlmaWNh
dGlvbiB5b3UgY2FuIG1ha2UgdG8gdGhlIG1hcCBmaWxlcyBpcyB0byBkZWZpbmUgYSBuZXcKbWlu
b3IgU092ZXJzaW9uIGFuZCBpbnRyb2R1Y2UgdGhlIG5ldyBmdW5jdGlvbnMgdGhlcmUgKGFsdGhv
dWdoIHdlIGNhbgphY2N1bXVsYXRlIG11bHRpcGxlIGFkZGl0aW9ucyB0byB0aGUgbm90LXlldC1y
ZWxlYXNlIFNPdmVyc2lvbiBpbiBtYXN0ZXIpLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
