From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/4] x86/e820: do not fixup memmap in
 copy_e820_map
Date: Wed, 2 Jan 2019 12:44:19 +0000
Message-ID: <20190102124419.otgxnqthim46suvy@zion.uk.xensource.com>
References: <20181228120404.50346-1-roger.pau@citrix.com>
 <20181228120404.50346-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KZoQ=PK=citrix.com=prvs=89816f56d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1geftF-0000dl-Hf
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 12:44:53 +0000
Content-Disposition: inline
In-Reply-To: <20181228120404.50346-3-roger.pau@citrix.com>
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

T24gRnJpLCBEZWMgMjgsIDIwMTggYXQgMDE6MDQ6MDJQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEFuZCBpbnN0ZWFkIHVzZSB0aGUgbmV3bHkgaW50cm9kdWNlZCBlODIwX3JlbW92
ZV9yYW5nZSBoZWxwZXIgdG8KPiByZW1vdmUgYW55IFJBTSByZWdpb24gZnJvbSB0aGUgbG93IDFN
QiBWR0EvUk9NIHJlZ2lvbiBhZnRlcndhcmRzLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGlu
dGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
