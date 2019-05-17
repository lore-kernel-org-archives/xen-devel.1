From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
Date: Fri, 17 May 2019 12:31:50 +0000
Message-ID: <1558096310831.98741@citrix.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRc1k-0007gi-PK
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 12:31:56 +0000
In-Reply-To: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Viktor Mitin <viktor.mitin.19@gmail.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

KEFwb2xvZ2llcyBmb3IgdGhlIHVzZSBvZiBvdXRsb29rIC0gSSdtIGhhdmluZyBlbWFpbCBwcm9i
bGVtcyBhdG0pLgoKQSBjYW5vbmljYWwgYWRkcmVzcyBpbiB4ODYgaXMgb25lIHdoaWNoIGlzIGNv
cnJlY3RseSBzaWduIGV4dGVuZGVkIGZyb20gYml0IDQ3IHRvIGJpdCA2My4KCldoYXQgaXMgdW5k
ZWZpbmVkIGFib3V0IHNoaWZ0aW5nIGludDY0X3QgYnkgNjMgYml0cz8gIFRoZSBhbnN3ZXIgaXMg
LTEgb3IgMCwgcHJlc2VydmluZyB0aGUgc2lnbiBiaXQgYWxvbmUgKHdoaWNoIGlzIHRoZSBwb2lu
dCBvZiB0aGUgY29tcGFyaXNvbikuCgp+QW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KRnJvbTogVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwu
Y29tPgpTZW50OiAxNyBNYXkgMjAxOSAxMjoyNQpUbzogSnVlcmdlbiBHcm9zczsgQW5kcmV3IENv
b3BlcjsgV2VpIExpdTsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNjOiBWb2xvZHlt
eXIgQmFiY2h1awpTdWJqZWN0OiBsaWJ4YzogQ2FzdGluZyBvZiB4ZW4gdmlydHVhbCBhZGRyZXNz
IHR5cGUgeGVuX3ZhZGRyX3QgdG8gc2lnbmVkIGludDY0IHR5cGU6IChpbnQ2NF90KXZhZGRyCgpI
aSBBbGwsCgpXaGlsZSBsb29raW5nIGF0IGNvZGUgaW4gdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94
ODZfcHYuYywKd2Ugc2VlIHRoYXQgdGhlcmUgaXMgY2FzdGluZyBvZiB4ZW4gdmlydHVhbCBhZGRy
ZXNzIHR5cGUgeGVuX3ZhZGRyX3QKdG8gc2lnbmVkIGludDY0IHR5cGUuCkluIGNvbW1pdDogN2Jm
NzQ1ODJiMzQzNjAzY2IwODI2ZDgwOGNkN2RhNDMzMjY0NTJhNQoKKy8qIENoZWNrIGEgNjQgYml0
IHZpcnR1YWwgYWRkcmVzcyBmb3IgYmVpbmcgY2Fub25pY2FsLiAqLworc3RhdGljIGlubGluZSBi
b29sIGlzX2Nhbm9uaWNhbF9hZGRyZXNzKHhlbl92YWRkcl90IHZhZGRyKQoreworICAgIHJldHVy
biAoKGludDY0X3QpdmFkZHIgPj4gNDcpID09ICgoaW50NjRfdCl2YWRkciA+PiA2Myk7Cit9CgpJ
dCBzZWVtcyB0aGVyZSBpcyBubyBuZWVkIHRvIGNhc3QgdmFkZHIgdmFyaWFibGUuIEl0IGxvb2tz
IGxpa2UKc2hpZnRpbmcgdmFkZHIgc2lnbmVkIDY0LWJpdCB2YWx1ZSBieSA2MyBiaXRzIGludHJv
ZHVjZXMgdW5kZWZpbmVkCmJlaGF2aW9yLiBDb3VsZCB5b3UgcGxlYXNlIGRlc2NyaWJlIHdoYXQg
aXMgdGhlIHJlYXNvbiBmb3IgdGhpcwpjYXN0aW5nPwoKVGhhbmtzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
