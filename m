From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/3] xen: modify parse_size_and_unit() to
 support percentage
Date: Mon, 10 Dec 2018 07:39:21 -0700
Message-ID: <5C0E7A990200007800204B7F@prv1-mh.provo.novell.com>
References: <20181210114422.27275-1-jgross@suse.com>
 <20181210114422.27275-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWMiU-0001Us-Vz
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 14:39:27 +0000
In-Reply-To: <20181210114422.27275-2-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjEyLjE4IGF0IDEyOjQ0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBNb2Rp
ZnkgcGFyc2Vfc2l6ZV9hbmRfdW5pdCgpIHRvIHN1cHBvcnQgYSB2YWx1ZSBmb2xsb3dlZCBieSBh
ICclJwo+IGNoYXJhY3Rlci4gSW4gdGhpcyBjYXNlIHBzIGlzIHJlcXVpcmVkIHRvIGJlIG5vbi1O
VUxMIHRvIGVuc3VyZSB0aGUKPiBjYWxsZXIgY2FuIGRldGVjdCB0aGF0IGNhc2UuIFRoZSByZXR1
cm5lZCB2YWx1ZSB3aWxsIGJlIHRoZSBpbnRlZ2VyCj4gdmFsdWUgcyB3YXMgcG9pbnRpbmcgdG8g
YW5kICpwcyB3aWxsIHBvaW50IHRvIHRoZSAnJScgY2hhcmFjdGVyLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
