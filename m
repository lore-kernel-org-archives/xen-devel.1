From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/pv: Fix the handing of writes to %dr7
Date: Fri, 23 Mar 2018 08:28:04 +0000
Message-ID: <5AB4C8A402000078001B5697@gwmail.emea.novell.com>
References: <1521746023-28706-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521746023-28706-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAzLjE4IGF0IDIwOjEzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gYy9zIDY1ZTM1NTQ5ICJ4ODYvUFY6IHN1cHBvcnQgZGF0YSBicmVha3BvaW50IGV4dGVu
c2lvbiByZWdpc3RlcnMiCj4gYWNjaWRlbnRhbGx5IGJyb2tlIHRoZSBoYW5kaW5nIG9mIHdyaXRl
cy4gIFRoZSBjYWxsIHRvIGFjdGl2YXRlX2RlYnVncmVncygpCj4gZG9lc24ndCB3cml0ZSAlZHI3
IGFzIHYtPmFyY2guZGVidWdyZWdbN10gaGFzbid0IGJlZW4gdXBkYXRlZCB5ZXQsIGFuZCB0aGUK
PiBicmVhayBza2lwcyB0aGUgaW50ZW5kZWQgd3JpdGUgdG8gJWRyNy4KClRoYXQncyByZWFsbHkg
b2RkLCBlc3BlY2lhbGx5IHdpdGggdGhlIGNvbW1lbnQgaW4gYWN0aXZhdGVfZGVidWdyZWdzKCkK
c3BlY2lmaWNhbGx5IHN0YXRpbmcgdGhhdCBmYWN0LgoKPiBSZW1vdmUgdGhlIGJyZWFrLCBjYXVz
aW5nIGV4ZWN1dGlvbiB0byBoaXQgdGhlIHdyaXRlX2RlYnVncmVnKDcsIHZhbHVlKTsgaW4KPiBj
b250ZXh0IGF0IHRoZSBib3R0b20gb2YgdGhlIGh1bmssIHdoaWNoIGluIHR1cm4gY2F1c2VzIGhh
cmR3YXJlIHRvIGJlIHVwZGF0ZWQKPiBhcHByb3ByaWF0ZWx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
