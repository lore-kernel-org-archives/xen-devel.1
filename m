From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v6.1 3/5] p2m: change write_p2m_entry to
 return an error code
Date: Thu, 28 Feb 2019 16:56:00 +0000
Message-ID: <d932f516-db4c-520c-e3d5-1617586543ac@citrix.com>
References: <20190227110905.53512-4-roger.pau@citrix.com>
 <20190227113031.53725-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BcS=RD=citrix.com=prvs=955e9f503=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gzOyz-0002C2-ID
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 16:56:29 +0000
In-Reply-To: <20190227113031.53725-1-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yNy8xOSAxMTozMCBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoaXMgaXMgaW4g
cHJlcGFyYXRpb24gZm9yIGFsc28gY2hhbmdpbmcgcDJtX2VudHJ5X21vZGlmeSB0byByZXR1cm4g
YW4KPiBlcnJvciBjb2RlLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
