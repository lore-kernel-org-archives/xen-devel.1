From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH for-4.11 v2 2/2] Add new add_maintainers.pl
 script to optimise the workflow when using git format-patch with
 get_maintainer.pl
Date: Tue, 1 May 2018 18:38:05 +0100
Message-ID: <23272.42493.54025.448610@mariner.uk.xensource.com>
References: <cover.1525005313.git.lars.kurth@citrix.com>
 <1935c3cc282228c806081ab47653215ca0080a3c.1525005313.git.lars.kurth@citrix.com>
 <23271.10702.618476.183954@mariner.uk.xensource.com>
 <96ED0EFF-C77D-4946-97FE-31731D9DE2AB@citrix.com>
 <23271.17046.529514.36171@mariner.uk.xensource.com>
 <2C272866-A075-4B32-9471-9B709BF90F89@citrix.com>
 <23272.25339.521207.449205@mariner.uk.xensource.com>
 <3B7630C6-E072-42CA-B67B-7E8EE2915C72@citrix.com>
 <23272.34020.765335.855905@mariner.uk.xensource.com>
 <9DEB1D90-0575-481A-B860-AE734B2F6E13@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t0l9=hu=citrix.com=prvs=652255aa1=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fDZER-0003qw-Pb
 for xen-devel@lists.xenproject.org; Tue, 01 May 2018 17:38:27 +0000
In-Reply-To: <9DEB1D90-0575-481A-B860-AE734B2F6E13@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

TGFycyBLdXJ0aCB3cml0ZXMgKCJSZTogW1BBVENIIGZvci00LjExIHYyIDIvMl0gQWRkIG5ldyBh
ZGRfbWFpbnRhaW5lcnMucGwgc2NyaXB0IHRvIG9wdGltaXNlIHRoZSB3b3JrZmxvdyB3aGVuIHVz
aW5nIGdpdCBmb3JtYXQtcGF0Y2ggd2l0aCBnZXRfbWFpbnRhaW5lci5wbCIpOgo+ICBNYXliZSB0
aGUgYmVzdCB3YXkgdG8gYXBwcm9hY2ggdGhpcyBpcwo+IHRvIGhhdmUgdHdvIG9wdGlvbnMgdGhh
dCBjb250cm9sIGhvdyBDQ3MgYXJlIGluc2VydGVkIGludG8gdGhlIGNvdmVyCj4gbGV0dGVyIGFu
ZCBhIHNlcGFyYXRlIG9uZSB0aGF0IGNvbnRyb2xzIGhvdyBDQ3MgYXJlIGluc2VydGVkIGludG8K
PiBwYXRjaGVzLgoKSSBkb24ndCBtaW5kIHRoZSBvcHRpb25zLiAgSSB0aGluayBJIGNhcmUgYWJv
dXQgdGhlIGRlZmF1bHQsIHdoaWNoIEkKdGhpbmsgc2hvdWxkIGJlIHRvIGluY2x1ZGUgYWxsIEND
cyBpbiBib3RoIGJvZGllcyBhbmQgaGVhZGVycy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
