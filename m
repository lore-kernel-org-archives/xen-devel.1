From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxc/arm: initialise p2m_size to make gcc
 happy
Date: Wed, 14 Mar 2018 12:37:06 +0000
Message-ID: <20180314123705.efp5t2norsliirjp@citrix.com>
References: <20180314123203.30646-1-wei.liu2@citrix.com>
 <07ee36ed-a2c9-ac56-bceb-a3f85cfb27cb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yxl5=ge=citrix.com=prvs=60440319b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ew5ev-0001Mu-Rl
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 12:37:33 +0000
Content-Disposition: inline
In-Reply-To: <07ee36ed-a2c9-ac56-bceb-a3f85cfb27cb@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTI6MzU6NDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNC8wMy8xOCAxMjozMiwgV2VpIExpdSB3cm90ZToKPiA+IEdjYyB3aXRoIC1P
MyBmYWlsZWQgdG8gc3BvdCB0aGUgbG9vcCB0byBpbml0aWFsaXNlIHAybV9zaXplIHJ1bnMgYXQK
PiA+IGxlYXN0IG9uY2UuCj4gCj4gSXQgaXMgLU9nIGluIHRoaXMgY2FzZSwgcmF0aGVyIHRoYW4g
LU8zLsKgIE15IC1PMyBjb21tZW50IG9uIHRoZSB0aHJlYWQKPiB3YXMgZm9yIHRoZSBtb3JlIGdl
bmVyaWMgY2FzZXMuCgpPSy4gSSB3aWxsIGZpeCB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIGNvZGUg
Y29tbWVudC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
