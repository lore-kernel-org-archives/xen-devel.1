From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Reducing or removing direct map from xen (was Re:
 Ongoing/future speculative mitigation work)
Date: Fri, 22 Feb 2019 04:48:09 -0700
Message-ID: <5C6FE1790200007800219178@prv1-mh.provo.novell.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <20190124114455.eyke5dvkqsxhklav@zion.uk.xensource.com>
 <20190220122901.6kvc7ibyjo4uyzke@zion.uk.xensource.com>
 <20190220130052.b22syaca6cswc3pk@Air-de-Roger>
 <20190220130956.tkhsmdojzdf4nc7x@zion.uk.xensource.com>
 <20190220170809.jr6neinf5beescf4@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gx9JN-0004jk-6w
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 11:48:13 +0000
In-Reply-To: <20190220170809.jr6neinf5beescf4@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, Joao Martins <joao.m.martins@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Mihai Dontu <mdontu@bitdefender.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Philipson <ross.philipson@oracle.com>, Dario Faggioli <dfaggioli@suse.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE5IGF0IDE4OjA4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDE6MDk6NTZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBbLi4uXQo+PiBJIHRoaW5rIHVuZGVyLWFsbG9jYXRlLXRoZW4tbWFwIGxvb2tzIHBsYXVzaWJs
ZS4geG1hbGxvYyB3aWxsIG5lZWQKPj4gdG8gYWxsb2NhdGUgcGFnZXMsIHB1dCB0aGVtIGludG8g
YW4gYXJyYXkgYW5kIGNhbGwgX192bWFwIG9uIHRoYXQgYXJyYXkKPj4gZGlyZWN0bHkuCj4gCj4g
VGhlIGJpZ2dlc3QgaXNzdWUgd2l0aCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgd2Ugbm93IG5lZWQg
YW4gYXJyYXkgb2YKPiAxVUw8PE1BWF9PUkRFUiB0byBhY2NvbW1vZGF0ZSBtZm5zLiBCYWNrIG9m
IGVudmVsb3BlIGNhbGN1bGF0aW9uOiBvbiB4ODYKPiB0aGlzIGlzIGdvaW5nIHRvIGJlICgxVUw8
PDIwKSo4IGJ5dGVzIGxvbmcuIFRoaXMgaXMgbm90IGZlYXNpYmxlLgoKQXJlIHdlIHJlYWxseSBj
YWxsaW5nIHhtYWxsb2MoKSB3aXRoIGFueSBudW1iZXIgbmVhcmx5IHRoaXMgYmlnPwoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
