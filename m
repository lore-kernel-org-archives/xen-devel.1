From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH 13/15] x86/xstate: Add Hygon Dhyana support
Date: Tue, 29 Jan 2019 04:15:40 -0700
Message-ID: <5C5035DC020000780014B869@prv1-mh.provo.novell.com>
References: <cover.1545284932.git.puwen@hygon.cn>
 <824969aace3e80e2909f600fa40e4e3713e25d96.1545284932.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1goRMo-0004Za-39
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 11:15:46 +0000
In-Reply-To: <824969aace3e80e2909f600fa40e4e3713e25d96.1545284932.git.puwen@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: puwen@hygon.cn
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IFB1IFdlbiA8cHV3ZW5AaHlnb24uY24+IDEyLzIwLzE4IDI6MTYgUE0gPj4+Cj4tLS0gYS94
ZW4vYXJjaC94ODYveHN0YXRlLmMKPisrKyBiL3hlbi9hcmNoL3g4Ni94c3RhdGUuYwo+QEAgLTM2
OSw3ICszNjksNyBAQCB2b2lkIHhyc3RvcihzdHJ1Y3QgdmNwdSAqdiwgdWludDY0X3QgbWFzaykK
PnVuc2lnbmVkIGludCBmYXVsdHMsIHByZXZfZmF1bHRzOwogPgo+LyoKPi0gICAgICogQU1EIENQ
VXMgZG9uJ3Qgc2F2ZS9yZXN0b3JlIEZEUC9GSVAvRk9QIHVubGVzcyBhbiBleGNlcHRpb24KPisg
ICAgICogQU1EIG9yIEh5Z29uIENQVXMgZG9uJ3Qgc2F2ZS9yZXN0b3JlIEZEUC9GSVAvRk9QIHVu
bGVzcyBhbiBleGNlcHRpb24KPiogaXMgcGVuZGluZy4gQ2xlYXIgdGhlIHg4NyBzdGF0ZSBoZXJl
IGJ5IHNldHRpbmcgaXQgdG8gZml4ZWQKPiogdmFsdWVzLiBUaGUgaHlwZXJ2aXNvciBkYXRhIHNl
Z21lbnQgY2FuIGJlIHNvbWV0aW1lcyAwIGFuZAo+KiBzb21ldGltZXMgbmV3IHVzZXIgdmFsdWUu
IEJvdGggc2hvdWxkIGJlIG9rLiBVc2UgdGhlIEZQVSBzYXZlZAo+QEAgLTM3Nyw3ICszNzcsOCBA
QCB2b2lkIHhyc3RvcihzdHJ1Y3QgdmNwdSAqdiwgdWludDY0X3QgbWFzaykKPiovCj5pZiAoICht
YXNrICYgcHRyLT54c2F2ZV9oZHIueHN0YXRlX2J2ICYgWDg2X1hDUjBfRlApICYmCj4hKHB0ci0+
ZnB1X3NzZS5mc3cgJiB+cHRyLT5mcHVfc3NlLmZjdyAmIDB4MDAzZikgJiYKPi0gICAgICAgICBi
b290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgKQo+KyAgICAgICAgIChi
b290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgfHwKPisgICAgICAgICAg
Ym9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfSFlHT04pICkKPmFzbSB2b2xh
dGlsZSAoICJmbmNsZXhcblx0IiAgICAgICAgLyogY2xlYXIgZXhjZXB0aW9ucyAqLwo+ImZmcmVl
ICUlc3QoNylcblx0IiAvKiBjbGVhciBzdGFjayB0YWcgKi8KPiJmaWxkbCAlMCIgICAgICAgICAg
LyogbG9hZCB0byBjbGVhciBzdGF0ZSAqLwoKQSBzaW1pbGFyIGNoYW5nZSB0aGVuIGlzIG5lZWRl
ZCB0byBmcHVfZnhyc3RvcigpIGFzIHdlbGwsIGluIGNhc2UgcGVvcGxlCmRpc2FibGUgdXNlIG9m
IFhTQVZFIHZpYSBjb21tYW5kIGxpbmUgb3B0aW9uLiBBbmQgdGhlbiB0aGVyZSB3YXMgYWxzbwph
IHJlY2VudCBjaGFuZ2UgdG8gdGhpcyBhcmVhIGJ5IEFuZHJldywgd2hpY2ggbWF5IGFmZmVjdCB5
b3UgYXMgd2VsbC4KKFNvcnJ5LCBJIGRvbid0IGhhdmUgYSBwb2ludGVyIGF0IGhhbmQuKQoKCkph
bgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
