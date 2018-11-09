From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: fix xen_qlock_wait()
Date: Fri, 9 Nov 2018 16:35:43 +0100
Message-ID: <67e80fc6-e47a-3ba2-09ce-b1c8557cc74c__12964.3632368699$1541777675$gmane$org@suse.com>
References: <20181109120413.9539-1-jgross@suse.com>
 <400409f5-397e-780b-d13b-19a1ee578f44@eikelenboom.it>
 <068f9560-598b-0228-463b-bc7f202cf8e0@suse.com>
 <913d7f22-9ec2-54be-3edb-a93a6adf4fda@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mbz9=nu=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gL8p2-0002US-5o
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 15:35:48 +0000
In-Reply-To: <913d7f22-9ec2-54be-3edb-a93a6adf4fda@eikelenboom.it>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: sstabellini@kernel.org, stable@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTEvMjAxOCAxNjoyOSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IE9uIDA5LzEx
LzE4IDE2OjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAwOS8xMS8yMDE4IDE2OjAyLCBT
YW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+PiBPbiAwOS8xMS8xOCAxMzowNCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToKPj4+PiBDb21taXQgYTg1NjUzMTk1MWRjODAgKCJ4ZW46IG1ha2UgeGVuX3Fs
b2NrX3dhaXQoKSBuZXN0YWJsZSIpCj4+Pj4gaW50cm9kdWNlZCBhIHJlZ3Jlc3Npb24gZm9yIFhl
biBndWVzdHMgcnVubmluZyBmdWxseSB2aXJ0dWFsaXplZAo+Pj4+IChIVk0gb3IgUFZIIG1vZGUp
LiBUaGUgWGVuIGh5cGVydmlzb3Igd291bGRuJ3QgcmV0dXJuIGZyb20gdGhlIHBvbGwKPj4+PiBo
eXBlcmNhbGwgd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkIGluIGNhc2Ugb2YgYW4gaW50ZXJydXB0
IChmb3IgUFYKPj4+PiBndWVzdHMgaXQgZG9lcykuCj4+Pj4KPj4+PiBTbyBpbnN0ZWFkIG9mIGRp
c2FibGluZyBpbnRlcnJ1cHRzIGluIHhlbl9xbG9ja193YWl0KCkgdXNlIGEgbmVzdGluZwo+Pj4+
IGNvdW50ZXIgdG8gYXZvaWQgY2FsbGluZyB4ZW5fY2xlYXJfaXJxX3BlbmRpbmcoKSBpbiBjYXNl
Cj4+Pj4geGVuX3Fsb2NrX3dhaXQoKSBpcyBuZXN0ZWQuCj4+Pj4KPj4+PiBGaXhlczogYTg1NjUz
MTk1MWRjODAgKCJ4ZW46IG1ha2UgeGVuX3Fsb2NrX3dhaXQoKSBuZXN0YWJsZSIpCj4+Pj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pgo+Pj4gQWx0aG91Z2ggeW91IGRvbid0IHNlZW0gdG9vIGlu
dGVyZXN0ZWQsIHlvdSBjYW4gc3RpY2sgb24gYToKPj4+IFRlc3RlZC1ieTogU2FuZGVyIEVpa2Vs
ZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4KPj4+IGlmIHlvdSBsaWtlLgo+Pgo+PiBJIGFt
IGludGVyZXN0ZWQuCj4+Cj4+IE9UT0ggSSB3YW50ZWQgdG8gcG9zdCB0aGUgcGF0Y2ggb2ZmaWNp
YWxseSB0byBnaXZlIG90aGVycyB0aGUgY2hhbmNlIHRvCj4+IHNlbmQgcmVtYXJrcy4KPiAKPiBP
Sywgd291bGQgYmUgbmljZSB0byBhdCBsZWFzdCBiZSBDQydlZCBvbiBwYXRjaGVzIGdvaW5nIHVw
c3RyZWFtIHdoZW4KPiB5b3UgaGF2ZSBiZWVuIHJlcG9ydGluZyBzdHVmZi4KClNvcnJ5LCBteSBm
YXVsdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
