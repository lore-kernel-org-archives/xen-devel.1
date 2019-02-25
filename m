From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH L1TF v8 8/9] x86/hvm: add nospec to hvmop
 param
Date: Mon, 25 Feb 2019 08:59:16 -0700
Message-ID: <5C7410D40200007800219FD6@prv1-mh.provo.novell.com>
References: <1551101683-996-1-git-send-email-nmanthey@amazon.de>
 <1551101683-996-9-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyIgz-0004fL-Og
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 16:01:21 +0000
In-Reply-To: <1551101683-996-9-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAyLjE5IGF0IDE0OjM0LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiAt
LS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0u
Ywo+IEBAIC00MTA5LDYgKzQxMDksMTEgQEAgc3RhdGljIGludCBodm1vcF9zZXRfcGFyYW0oCj4g
ICAgICBpZiAoIGEuaW5kZXggPj0gSFZNX05SX1BBUkFNUyApCj4gICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gIAo+ICsgICAgLyoKPiArICAgICAqIE1ha2Ugc3VyZSB0aGUgYWJvdmUgYm91bmQg
Y2hlY2sgaXMgbm90IGJ5cGFzc2VkIGR1cmluZyBzcGVjdWxhdGlvbi4KPiArICAgICAqLwo+ICsg
ICAgYmxvY2tfc3BlY3VsYXRpb24oKTsKPiArCj4gICAgICBkID0gcmN1X2xvY2tfZG9tYWluX2J5
X2FueV9pZChhLmRvbWlkKTsKPiAgICAgIGlmICggZCA9PSBOVUxMICkKPiAgICAgICAgICByZXR1
cm4gLUVTUkNIOwo+IEBAIC00Mzc1LDYgKzQzODAsMTEgQEAgc3RhdGljIGludCBodm1vcF9nZXRf
cGFyYW0oCj4gICAgICBpZiAoIGEuaW5kZXggPj0gSFZNX05SX1BBUkFNUyApCj4gICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4gIAo+ICsgICAgLyoKPiArICAgICAqIE1ha2Ugc3VyZSB0aGUgYWJv
dmUgYm91bmQgY2hlY2sgaXMgbm90IGJ5cGFzc2VkIGR1cmluZyBzcGVjdWxhdGlvbi4KPiArICAg
ICAqLwo+ICsgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsKCkNvbW1lbnQgc3R5bGUgKHNpbmdsZSBs
aW5lKSBpbiBib3RoIGNhc2VzLiBUaGlzIGNvdWxkIGJlIGRvbmUgd2hpbGUKY29tbWl0dGluZywg
YW5kIHdpdGggaXQgdGFrZW4gY2FyZSBvZgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
