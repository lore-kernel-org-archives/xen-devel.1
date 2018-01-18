From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 7/7] xen/pvshim: switch shim.c to use
 typesafe mfn_to_page and virt_to_mfn
Date: Thu, 18 Jan 2018 11:06:30 +0000
Message-ID: <946ead24-ab1e-cde1-2239-ad8dfce5e165@citrix.com>
References: <20180118110252.41504-1-roger.pau@citrix.com>
 <20180118110252.41504-8-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mzwf=en=citrix.com=prvs=549b675a5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ec81m-0006Rd-F4
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 11:06:38 +0000
In-Reply-To: <20180118110252.41504-8-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDEvMTggMTE6MDIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBObyBmdW5jdGlvbmFs
IGNoYW5nZSBpbnRlbmRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFJlcXVlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
