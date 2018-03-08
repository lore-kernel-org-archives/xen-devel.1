From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/6] xen/x86: disable global pages for
 domains with XPTI active
Date: Thu, 08 Mar 2018 08:06:47 -0700
Message-ID: <5AA15F9702000078001AFDDF@prv-mh.provo.novell.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bbjo=f6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1etx8D-0007Mr-Hf
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 15:06:57 +0000
In-Reply-To: <20180302081403.16953-5-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAzLjE4IGF0IDA5OjE0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MTIzLDIyICsxNDIsMTQgQEAgdW5zaWduZWQgaW50IGZsdXNoX2FyZWFfbG9jYWwoY29uc3Qgdm9p
ZCAqdmEsIHVuc2lnbmVkIGludCBmbGFncykKPiAgICAgICAgICAgICAgdTMyIHQgPSBwcmVfZmx1
c2goKTsKPiAgCj4gICAgICAgICAgICAgIGlmICggIWNwdV9oYXNfaW52cGNpZCApCj4gLSAgICAg
ICAgICAgIHsKPiAtICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgY3I0ID0gcmVhZF9jcjQo
KTsKPiAtCj4gLSAgICAgICAgICAgICAgICB3cml0ZV9jcjQoY3I0ICYgflg4Nl9DUjRfUEdFKTsK
PiAtICAgICAgICAgICAgICAgIGJhcnJpZXIoKTsKPiAtICAgICAgICAgICAgICAgIHdyaXRlX2Ny
NChjcjQpOwo+IC0gICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgICBkb19mbHVzaF90bGIo
MCk7Cj4gICAgICAgICAgICAgIGVsc2UKPiAtICAgICAgICAgICAgewo+ICAgICAgICAgICAgICAg
ICAgLyoKPiAgICAgICAgICAgICAgICAgICAqIFVzaW5nIGludnBjaWQgdG8gZmx1c2ggYWxsIG1h
cHBpbmdzIHdvcmtzCj4gICAgICAgICAgICAgICAgICAgKiByZWdhcmRsZXNzIG9mIHdoZXRoZXIg
UENJRCBpcyBlbmFibGVkIG9yIG5vdC4KPiAgICAgICAgICAgICAgICAgICAqIEl0IGlzIGZhc3Rl
ciB0aGFuIHJlYWQtbW9kaWZ5LXdyaXRlIENSNC4KPiAgICAgICAgICAgICAgICAgICAqLwo+ICAg
ICAgICAgICAgICAgICAgaW52cGNpZF9mbHVzaF9hbGwoKTsKPiAtICAgICAgICAgICAgfQoKQnR3
LCB0aGlzIGlzIGNvcnJlY3QgZm9yIEZMVVNIX1RMQl9HTE9CQUwsIGJ1dCBnb2VzIHRvbyBmYXIg
Zm9yCkZMVVNIX1RMQi4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
