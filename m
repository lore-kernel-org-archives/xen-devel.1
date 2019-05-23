From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH L1TF MDS GT v1 1/3] common/grant_table:
 harden helpers
Date: Thu, 23 May 2019 07:57:56 -0600
Message-ID: <5CE6A6E40200007800231BC0@prv1-mh.provo.novell.com>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-2-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hToEO-00064f-M1
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 13:58:04 +0000
In-Reply-To: <1558424746-24059-2-git-send-email-nmanthey@amazon.de>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA1LjE5IGF0IDA5OjQ1LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBH
dWVzdHMgY2FuIGlzc3VlIGdyYW50IHRhYmxlIG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3Qg
Y29udHJvbGxlZAo+IGRhdGEgdG8gdGhlbS4gVGhpcyBkYXRhIGlzIHVzZWQgZm9yIG1lbW9yeSBs
b2FkcyBpbiBoZWxwZXIgZnVuY3Rpb25zCj4gYW5kIG1hY3Jvcy4gVG8gYXZvaWQgc3BlY3VsYXRp
dmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzLCB3ZSB1c2UgdGhlCj4gYXJyYXlfaW5kZXhfbm9zcGVj
IG1hY3JvIHdoZXJlIGFwcGxpY2FibGUsIG9yIHRoZSBibG9ja19zcGVjdWxhdGlvbgo+IG1hY3Jv
Lgo+IAo+IFRoaXMgaXMgcGFydCBvZiB0aGUgc3BlY3VsYXRpdmUgaGFyZGVuaW5nIGVmZm9ydC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4K
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
