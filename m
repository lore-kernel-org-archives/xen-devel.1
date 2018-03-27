From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 for-4.11] kconfig: don't select VPCI if
 building a shim-only binary
Date: Tue, 27 Mar 2018 16:38:45 +0100
Message-ID: <20180327153845.kb46eleq7b77lgwg@citrix.com>
References: <20180327153026.93720-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xo86=gr=citrix.com=prvs=61733587f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f0qh7-0000Ce-VG
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 15:39:29 +0000
Content-Disposition: inline
In-Reply-To: <20180327153026.93720-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDQ6MzA6MjZQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEFkZCBkdW1teSByZXBsYWNlbWVudHMgZm9yIHNvbWUgZnVuY3Rpb25zIHVzZWQg
b3V0c2lkZSBvZiB0aGUgdnBjaQo+IGNvZGUsIGFuZCBhbHNvIGEgZ3VhcmQgaW4gdm1zaS5jIHRv
IHByZXZlbnQgdnBjaSBhcmNoIHNwZWNpZmljIGhlbHBlcnMKPiBmcm9tIGJlaW5nIGNvbXBpbGVk
IGlmIHRoZSBvcHRpb24gaXMgbm90IHNlbGVjdGVkLgo+IAo+IFJlcG9ydGVkLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
