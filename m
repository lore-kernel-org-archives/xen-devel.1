From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/3] xen/pt: initialize 'warned' field of
 arch_msix properly
Date: Fri, 21 Dec 2018 03:17:30 -0700
Message-ID: <5C1CBDBA020000780020872D@prv1-mh.provo.novell.com>
References: <1545319776-23459-1-git-send-email-chao.gao@intel.com>
 <1545319776-23459-3-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gaHs6-0008UX-Kj
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 10:17:34 +0000
In-Reply-To: <1545319776-23459-3-git-send-email-chao.gao@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDE2OjI5LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiAt
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21zaS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9tc2kuaAo+IEBAIC0yNTIsNSArMjUyLDEwIEBAIHZvaWQgZ3Vlc3RfbWFza19tc2lfaXJxKHN0
cnVjdCBpcnFfZGVzYyAqLCBib29sIG1hc2spOwo+ICB2b2lkIGFja19ub25tYXNrYWJsZV9tc2lf
aXJxKHN0cnVjdCBpcnFfZGVzYyAqKTsKPiAgdm9pZCBlbmRfbm9ubWFza2FibGVfbXNpX2lycShz
dHJ1Y3QgaXJxX2Rlc2MgKiwgdTggdmVjdG9yKTsKPiAgdm9pZCBzZXRfbXNpX2FmZmluaXR5KHN0
cnVjdCBpcnFfZGVzYyAqLCBjb25zdCBjcHVtYXNrX3QgKik7Cj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBpbml0X2FyY2hfbXNpeChzdHJ1Y3QgYXJjaF9tc2l4ICptc2l4KQo+ICt7Cj4gKyAgICBzcGlu
X2xvY2tfaW5pdCgmbXNpeC0+dGFibGVfbG9jayk7Cj4gKyAgICBtc2l4LT53YXJuZWQgPSBET01J
RF9JTlZBTElEOwo+ICt9CgpJIHRoaW5rIHRoaXMgd291bGQgYmV0dGVyIHNpdCBuZXh0IHRvIHRo
ZSBzdHJ1Y3R1cmUgZGVmaW5pdGlvbiwKaS5lLiBhIGZldyBsaW5lcyB1cC4gSW4gYW55IGV2ZW50
IGEgc2VwYXJhdGluZyBibGFuayBsaW5lCm5lZWRzIGFkZGluZy4gV2l0aCB0aGF0ClJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBZGRpdGlvbmFsbHkgcGVyaGFw
cyBhcmNoX2luaXRfbXNpeCgpIHdvdWxkIGJldHRlciBmaXQgb3VyCmdlbmVyYWwgbmFtaW5nIG9m
IGFyY2gtc3BlY2lmaWMgZnVuY3Rpb25zLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
