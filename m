From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 15/16] xen/x86: Switch mfn_to_page in
 x86_64/mm.c to use typesafe MFN
Date: Fri, 02 Mar 2018 08:57:18 -0700
Message-ID: <5A99826E02000078001ADEDD@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-16-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221140259.29360-16-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEBAIC0xNjAsNyArMTYyLDggQEAgc3RhdGljIGludCBtMnBfbWFwcGVkKHVuc2lnbmVkIGxvbmcg
c3BmbikKPiAgCj4gIHN0YXRpYyBpbnQgc2hhcmVfaG90YWRkX20ycF90YWJsZShzdHJ1Y3QgbWVt
X2hvdGFkZF9pbmZvICppbmZvKQo+ICB7Cj4gLSAgICB1bnNpZ25lZCBsb25nIGksIG4sIHYsIG0y
cF9zdGFydF9tZm4gPSAwOwo+ICsgICAgdW5zaWduZWQgbG9uZyBpLCBuLCB2Owo+ICsgICAgbWZu
X3QgbTJwX3N0YXJ0X21mbiA9IF9tZm4oMCk7CgpJTlZBTElEX01GTiBhZ2FpbiBwbGVhc2UuCgpX
aXRoIHRoYXQKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
