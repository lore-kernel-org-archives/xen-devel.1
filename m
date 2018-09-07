From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/6] xen/x86: Use %*pb[l] instead of
 cpumask_scn{, list}printf()
Date: Fri, 07 Sep 2018 02:12:58 -0600
Message-ID: <5B92330A02000078001E6324@prv1-mh.provo.novell.com>
References: <1536235696-31359-1-git-send-email-andrew.cooper3@citrix.com>
 <1536235696-31359-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1536235696-31359-5-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA5LjE4IGF0IDE0OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMKPiArKysgYi94ZW4vYXJj
aC94ODYvY3B1L21jaGVjay9tY2UuYwo+IEBAIC01MzUsOSArNTM1LDEyIEBAIHZvaWQgbWNoZWNr
X2Ntbl9oYW5kbGVyKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+ICAgICAgICAg
ICAgICBtY19wYW5pYygiTUNFOiBObyBDUFUgZm91bmQgdmFsaWQgTUNFLCBuZWVkIHJlc2V0Iik7
Cj4gICAgICAgICAgaWYgKCAhY3B1bWFza19lbXB0eSgmbWNlX2ZhdGFsX2NwdXMpICkKPiAgICAg
ICAgICB7Cj4gLSAgICAgICAgICAgIGNoYXIgKmVidWZwLCBlYnVmWzk2XSA9ICJNQ0U6IEZhdGFs
IGVycm9yIGhhcHBlbmVkIG9uIENQVXMgIjsKPiAtICAgICAgICAgICAgZWJ1ZnAgPSBlYnVmICsg
c3RybGVuKGVidWYpOwo+IC0gICAgICAgICAgICBjcHVtYXNrX3NjbnByaW50ZihlYnVmcCwgOTUg
LSBzdHJsZW4oZWJ1ZiksICZtY2VfZmF0YWxfY3B1cyk7Cj4gKyAgICAgICAgICAgIGNoYXIgZWJ1
Zls5Nl07Cj4gKwo+ICsgICAgICAgICAgICBzbnByaW50ZihlYnVmLCBzaXplb2YoZWJ1ZiksCj4g
KyAgICAgICAgICAgICAgICAgICAgICJNQ0U6IEZhdGFsIGVycm9yIGhhcHBlbmVkIG9uIENQVXMg
JSpwZCIsCgpEWU0gJSpwYiBoZXJlPyBXaXRoIHRoaXMgY29ycmVjdGVkClJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
