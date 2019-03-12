From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v6 02/12] microcode/intel: use union to get
 fields without shifting and masking
Date: Tue, 12 Mar 2019 16:33:37 +0100
Message-ID: <20190312153337.nt4dwkufcjc7zvqc@Air-de-Roger>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-3-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X81M=RP=citrix.com=prvs=96733c0e6=roger.pau@srs-us1.protection.inumbo.net>)
 id 1h3jjP-0007fz-1Q
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 15:54:19 +0000
Content-Disposition: inline
In-Reply-To: <1552291056-20286-3-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgMDM6NTc6MjZQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
CgpQbGVhc2UgYWRkICJObyBmdW5jdGlvbmFsIGNoYW5nZSIgdG8gdGhlIGNvbW1pdCBkZXNjcmlw
dGlvbi4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KClRoaXMgY2FuIGxpa2VseSBnbyBpbiBhaGVhZCBvZiB0aGUgcmVzdCBvZiB0aGUgc2VyaWVz
LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
