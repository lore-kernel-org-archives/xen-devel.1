From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v1] x86/hvm: Clean up may_defer from hvm_*
 helpers
Date: Wed, 24 Oct 2018 10:47:22 +0100
Message-ID: <20181024094722.ylxa6wmg63d2wfxp@zion.uk.xensource.com>
References: <20181024091849.15572-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2cs1=ne=citrix.com=prvs=828e4d37b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gFFl9-0007Id-40
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 09:47:27 +0000
Content-Disposition: inline
In-Reply-To: <20181024091849.15572-1-aisaila@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "brian.woods@amd.com" <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMjQsIDIwMTggYXQgMDk6MTk6MDZBTSArMDAwMCwgQWxleGFuZHJ1IFN0ZWZh
biBJU0FJTEEgd3JvdGU6Cj4gVGhlIG1heV9kZWZlciB2YXIgd2FzIGxlZnQgd2l0aCB0aGUgb2xk
ZXIgYm9vbF90IHR5cGUuIFRoaXMgcGF0Y2gKPiBjaGFuZ2VzIHRoZSB0eXBlIHRvIGJvb2wuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5j
b20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
