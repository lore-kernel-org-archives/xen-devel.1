From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [BUG linux-4.9.x] xen hotplug cpu leads to 100%
 steal usage
Date: Sat, 2 Mar 2019 00:43:47 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1903020030320.1638__3173.91410223848$1551483892$gmane$org@nanos.tec.linutronix.de>
References: <841bb9a9-1cba-483f-a353-1209684f7c74@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lt8c=RE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1gzron-00015E-7s
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2019 23:43:53 +0000
In-Reply-To: <841bb9a9-1cba-483f-a353-1209684f7c74@default>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: jgross@suse.com, Herbert Van Den Bergh <herbert.van.den.bergh@oracle.com>, sstabellini@kernel.org, sboyd@kernel.org, joe.jin@oracle.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, john.stultz@linaro.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyOCBGZWIgMjAxOSwgRG9uZ2xpIFpoYW5nIHdyb3RlOgo+IAo+IFRoZSByb290IGNh
dXNlIGlzIHRoYXQgdGhlIHJldHVybiB0eXBlIG9mIGppZmZpZXNfdG9fdXNlY3MoKSBpcyAndW5z
aWduZWQgaW50JywKPiBidXQgbm90ICd1bnNpZ25lZCBsb25nJy4gQXMgYSByZXN1bHQsIHRoZSBs
ZWFkaW5nIDMyIGJpdHMgYXJlIGRpc2NhcmRlZC4KCkVycm0uIE5vLiBUaGUgcm9vdCBjYXVzZSBp
cyB0aGF0IGppZmZpZXNfdG9fdXNlY3MoKSBpcyB1c2VkIGZvciB0aGF0IGluIHRoZQpmaXJzdCBw
bGFjZS4gVGhlIGZ1bmN0aW9uIGhhcyBiZWVuIHRoYXQgd2F5IGZvcmV2ZXIgYW5kIGFsbCB1c2Fn
ZSBzaXRlcwooZXhjZXB0IGEgYnJva2VuIGRldl9kZWJ1ZyBwcmludCBpbiBpbmZpbmliYW5kKSBm
ZWVkIGRlbHRhIHZhbHVlcy4gWWVzLCBpdApjb3VsZCBoYXZlIGRvY3VtZW50YXRpb24uLi4uCgo+
IGppZmZpZXNfdG9fdXNlY3MoKSBpcyBpbmRpcmVjdGx5IHRyaWdnZXJlZCBieSBjcHV0aW1lX3Rv
X25zZWNzKCkgYXQgbGluZSAyNjQuCj4gSWYgZ3Vlc3QgaXMgYWxyZWFkeSB1cCBmb3IgbG9uZyB0
aW1lLCB0aGUgaW5pdGlhbCBzdGVhbCB0aW1lIGZvciBuZXcgdmNwdSBtaWdodAo+IGJlIGxhcmdl
IGFuZCB0aGUgbGVhZGluZyAzMiBiaXRzIG9mIGppZmZpZXNfdG9fdXNlY3MoKSB3b3VsZCBiZSBk
aXNjYXJkZWQuCgo+IFNvIGZhciwgSSBoYXZlIHR3byBzb2x1dGlvbnM6Cj4gCj4gMS4gQ2hhbmdl
IHRoZSByZXR1cm4gdHlwZSBmcm9tICd1bnNpZ25lZCBpbnQnIHRvICd1bnNpZ25lZCBsb25nJyBh
cyBpbiBhYm92ZQo+IGxpbmsgYW5kIEkgYW0gYWZyYWlkIGl0IHdvdWxkIGJyaW5nIHNpZGUgZWZm
ZWN0LiBUaGUgcmV0dXJuIHR5cGUgaW4gbGF0ZXN0Cj4gbWFpbmxpbmUga2VybmVsIGlzIHN0aWxs
ICd1bnNpZ25lZCBpbnQnLgoKQ2hhbmdpbmcgaXQgdG8gdW5zaWduZWQgbG9uZyB3b3VsZCBqdXN0
IHNvbHZlIHRoZSBpc3N1ZSBmb3IgNjRiaXQuCgpUaGFua3MsCgoJdGdseAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
