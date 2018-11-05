From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/7] x86/domctl: rework XEN_DOMCTL_{set,
 get}_address_size
Date: Mon, 5 Nov 2018 14:08:10 +0000
Message-ID: <c213081d-c93e-3361-78d7-4670b75e3244@citrix.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <22488bd886230a8039240b6714c08f8baa4e525c.1541174103.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y45x=nq=citrix.com=prvs=8403a2554=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gJfac-0002di-KL
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 14:10:50 +0000
In-Reply-To: <22488bd886230a8039240b6714c08f8baa4e525c.1541174103.git-series.wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTEvMTggMTU6NTUsIFdlaSBMaXUgd3JvdGU6Cj4gR29pbmcgdGhyb3VnaCB0b29sc3Rh
Y2sgY29kZSwgdGhleSBhcmUgdXNlZCBmb3IgUFYgZ3Vlc3RzIG9ubHkuCj4KPiBUaWdodGVuIHRo
ZWlyIGFjY2VzcyB0byBQViBvbmx5LiBSZXR1cm4gLUVPUE5PVFNVUFAgaWYgdGhleSBhcmUgY2Fs
bGVkCj4gb24gSFZNIGd1ZXN0cy4gUmV3cml0ZSB0aGUgY29kZSBpbiBhIHBhdHRlcm4gdGhhdCBt
YWtlcyBEQ0Ugd29yay4KPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
