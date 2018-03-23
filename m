From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.11] x86/libxc: fix usage of
 XEN_X86_EMU_ALL after VPCI addition
Date: Fri, 23 Mar 2018 14:27:02 +0000
Message-ID: <20180323142702.kzpfswktwako4kqf@citrix.com>
References: <20180323105756.72586-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=48bv=gn=citrix.com=prvs=6131b936e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ezNg6-0001YH-Gj
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 14:28:22 +0000
Content-Disposition: inline
In-Reply-To: <20180323105756.72586-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMjMsIDIwMTggYXQgMTA6NTc6NTZBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEhWTSBndWVzdCBzaG91bGQgYmUgY3JlYXRlZCB3aXRoIChYRU5fWDg2X0VNVV9B
TEwgJgo+IH5YRU5fWDg2X0VNVV9WUENJKS4gVGhpcyBpcyBub3QgYW4gaXNzdWUgZm9yIHhsL2xp
YnhsIGJlY2F1c2UgaXQKPiBhbHJlYWR5IHNldHMgdGhlIGNvcnJlY3QgZW11bGF0aW9uIGZsYWdz
IGFuZCBkb2Vzbid0IHBhc3MgYSBOVUxMCj4geGNfZG9tYWluX2NvbmZpZ3VyYXRpb25fdCB0byB4
Y19kb21haW5fY3JlYXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
