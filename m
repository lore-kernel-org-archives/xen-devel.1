From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Wed, 13 Mar 2019 08:30:51 -0600
Message-ID: <5C89141B020000780021E2A1@prv1-mh.provo.novell.com>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190313112339.73774003.olaf@aepfle.de>
 <5C88DD8E020000780021E0A6@prv1-mh.provo.novell.com>
 <20190313143541.6a008762.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h44uE-0008GG-ON
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 14:30:54 +0000
In-Reply-To: <20190313143541.6a008762.olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDE0OjM1LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IEFtIFdl
ZCwgMTMgTWFyIDIwMTkgMDQ6Mzg6MDYgLTA2MDAKPiBzY2hyaWViICJKYW4gQmV1bGljaCIgPEpC
ZXVsaWNoQHN1c2UuY29tPjoKPiAKPj4gQnV0IHRoaXMgYWZmZWN0cyBhIGd1ZXN0IGV2ZW4gYWhl
YWQgb2YgbWlncmF0aW9uLiBXaGF0IGlmIG9uZQo+PiB1c2VzIG1pZ3JhdGlvbiByZWFsbHkganVz
dCBmb3IgZW1lcmdlbmNpZXM/IFdoeSB3b3VsZCB0aGV5Cj4+IHJ1biB0aGVpciBndWVzdHMgaW4g
YWx3YXlzLWVtdWxhdGUgbW9kZT8KPiAKPiBCZWNhdXNlIHRoaXMgaXMgd2hhdCB0aGV5IHdpbGwg
ZW5kIHVwIGZvciB0aGUgbGlmZXRpbWUgb2YgdGhlIGRvbVUgYWZ0ZXIgCj4gbWlncmF0aW9uPwoK
V2VsbCwgbXkgcmVwbHkgd2FzIHJlYWxseSBzdWdnZXN0aW5nIHRoYXQgdGhlIGd1ZXN0IG1heSBu
ZXZlciBnZXQKbWlncmF0ZWQgaW4gdGhlIGZpcnN0IHBsYWNlLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
