From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/4] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
Date: Thu, 14 Mar 2019 01:49:50 -0600
Message-ID: <5C8A079E020000780021E646@prv1-mh.provo.novell.com>
References: <20190311180911.2108-1-paul.durrant@citrix.com>
 <20190311180911.2108-2-paul.durrant@citrix.com>
 <5C8927C9020000780021E432@prv1-mh.provo.novell.com>
 <96aa5dc665844f82a33ec231ad5eda34@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4L7k-00057k-I5
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 07:49:56 +0000
In-Reply-To: <96aa5dc665844f82a33ec231ad5eda34@AMSPEX02CL02.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDE3OjA1LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5w
cm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIEphbiBCZXVsaWNoCj4+IFNlbnQ6IDEzIE1hcmNoIDIw
MTkgMTU6NTUKPj4gCj4+ID4+PiBPbiAxMS4wMy4xOSBhdCAxOTowOSwgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPiB3cm90ZToKPj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21zci5oCj4+
ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3IuaAo+PiA+IEBAIC0zMjgsNyArMzI4LDcg
QEAgaW50IGluaXRfdmNwdV9tc3JfcG9saWN5KHN0cnVjdCB2Y3B1ICp2KTsKPj4gPiAgICogVGhl
c2UgZnVuY3Rpb25zIGFyZSBhbHNvIHVzZWQgYnkgdGhlIG1pZ3JhdGlvbiBsb2dpYywgc28gbmVl
ZCB0byBjb3BlIHdpdGgKPj4gPiAgICogYmVpbmcgdXNlZCBvdXRzaWRlIG9mIHYncyBjb250ZXh0
Lgo+PiA+ICAgKi8KPj4gPiAtaW50IGd1ZXN0X3JkbXNyKGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB1
aW50MzJfdCBtc3IsIHVpbnQ2NF90ICp2YWwpOwo+PiA+ICtpbnQgZ3Vlc3RfcmRtc3Ioc3RydWN0
IHZjcHUgKnYsIHVpbnQzMl90IG1zciwgdWludDY0X3QgKnZhbCk7Cj4+IAo+PiBJIGZpbmQgdGhp
cyBwcmV0dHkgdW5kZXNpcmFibGUsIGFuZCBJJ2QgbGlrZSB0byBhdCBsZWFzdCBwdXQgb3V0Cj4+
IGZvciBkaXNjdXNzaW9uIGEgbWVhbnMgaG93IHRvIGF2b2lkIGl0OiBBbnkgZW50aXR5IGJlaW5n
Cj4+IHBhc3NlZCBhIGNvbnN0IHN0cnVjdCB2Y3B1ICpjdiBjYW4gZ2V0IGhvbGQgb2YgYSBub24t
Y29uc3QKPj4gb25lIGJ5IGRvaW5nCj4+IAo+PiAgICAgc3RydWN0IHZjcHUgKnYgPSBjdi0+ZG9t
YWluLT52Y3B1W2N2LT52Y3B1X2lkXTsKPj4gCj4gCj4gTG9va3Mga2luZCBvZiBvZGQsIGJ1dCBv
ZiBjb3Vyc2UgaXQgd2lsbCBjZXJ0YWlubHkgd29yay4KPiAKPj4gT2YgY291cnNlIHRoaXMgc2hv
dWxkbid0IGJlIHVzZWQgYXJiaXRyYXJpbHksIGJ1dCB0byBoaWRlIGFuCj4+IGltcGxlbWVudGF0
aW9uIGRldGFpbCBsaWtlIHRoYXQgb2Ygdm14X3ZtY3NfZW50ZXIoKSBJIHRoaW5rCj4+IHRoaXMg
Y291bGQgYmUganVzdGlmaWVkLiBUaG91Z2h0cz8KPj4gCj4gCj4gSSBndWVzcyB0aGUgcXVlc3Rp
b24gaXMgYXQgd2hhdCBsZXZlbCB0byBkbyB0aGlzPyBQcm9iYWJseSBpbiB0aGUgaHZtIGNvZGUg
Cj4gcmF0aGVyIHRoYW4gaW4gdGhlIHZteCBjb2RlLgoKSSB0aGluayBpdCBzaG91bGQgYmUgaW4g
Vk1YIGNvZGUsIGFzIHRoYXQncyB3aGVyZSB0aGUKdm14X3ZtY3NfZW50ZXIoKSBvZGRpdHkgbGl2
ZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
