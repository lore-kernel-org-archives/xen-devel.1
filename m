From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] VMX: don't needlessly write CR4 guest/host
 mask
Date: Fri, 29 Jun 2018 14:46:19 +0100
Message-ID: <e4cbdede-cdc9-279e-0733-198965153355@citrix.com>
References: <5B36312402000078001CF2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vmj+=jp=citrix.com=prvs=71170ba8f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fYtjC-0004ZN-Il
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 13:46:22 +0000
In-Reply-To: <5B36312402000078001CF2A2@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDYvMTggMTQ6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluIHNoYWRvdyBtb2RlIHRo
ZSBmaWVsZCBuZXZlciBjaGFuZ2VzIGZyb20gfjBVTCwgc28gdGhlcmUncyBubyBuZWVkIGZvcgo+
IGEgVk1XUklURSAob3IgYW4gdXBkYXRlIG9mIGl0cyBjYWNoZWQgdmFsdWUpLgo+Cj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
