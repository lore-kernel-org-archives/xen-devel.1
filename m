From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/vmx: correctly gather gs_shadow
 value for current vCPU
Date: Thu, 02 May 2019 02:36:36 -0600
Message-ID: <5CCAAC14020000780022B0DC@prv1-mh.provo.novell.com>
References: <20190501235203.1179-1-tamas@tklengyel.com>
 <01d02c64-a044-5c6f-d411-ec50abb83408@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM7Cw-0001MT-1x
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 08:36:46 +0000
In-Reply-To: <01d02c64-a044-5c6f-d411-ec50abb83408@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA1LjE5IGF0IDA4OjIwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gNS8yLzE5IDI6NTIgQU0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgv
dm14LmMKPj4gQEAgLTc3OSwxMiArNzc5LDE3IEBAIHN0YXRpYyB2b2lkIHZteF9sb2FkX2NwdV9z
dGF0ZShzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IGh2bV9od19jcHUgKmRhdGEpCj4+ICAKPj4gIHN0
YXRpYyB2b2lkIHZteF9zYXZlX3ZtY3NfY3R4dChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IGh2bV9o
d19jcHUgKmN0eHQpCj4+ICB7Cj4+ICsgICAgaWYgKCB2ID09IGN1cnJlbnQgKQo+PiArICAgICAg
ICB2bXhfc2F2ZV9ndWVzdF9tc3JzKHYpOwo+IAo+IHZteF9zYXZlX2d1ZXN0X21zcnMoKSBpcyBz
aW1wbGUgZW5vdWdoIHRoYXQgdGhlIGlmIGlzIHByb2JhYmx5IG5vdAo+IG5lY2Vzc2FyeSBoZXJl
ICh3ZSBjYW4ganVzdCBjYWxsIHRoZSBmdW5jdGlvbiBkaXJlY3RseSwgcmVnYXJkbGVzcyBvZgo+
IHdoYXQgdiBob2xkcykuCgpBdm9pZGluZyBhbiBNU1IgYWNjZXNzIGlzIHBlcmhhcHMgd29ydGgg
dGhlIGNvbmRpdGlvbmFsLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
