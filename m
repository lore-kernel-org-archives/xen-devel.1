From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 2/3] x86/mm-locks: convert some macros to
 inline functions
Date: Wed, 19 Dec 2018 11:01:18 +0000
Message-ID: <89da80f9-454b-f8e1-bc58-f1686e84f87a@citrix.com>
References: <20181218160542.56173-1-roger.pau@citrix.com>
 <20181218160542.56173-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+ona=O4=citrix.com=prvs=884475cec=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gZZbO-0006K2-AQ
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 11:01:22 +0000
In-Reply-To: <20181218160542.56173-3-roger.pau@citrix.com>
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTgvMTggNDowNSBQTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFuZCByZW5hbWUg
dG8gaGF2ZSBvbmx5IG9uZSBwcmVmaXggdW5kZXJzY29yZSB3aGVyZSBhcHBsaWNhYmxlLgo+IAo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
