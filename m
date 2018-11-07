From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: Guest soft lockups with "xen: make xen_qlock_wait()
 nestable"
Date: Wed, 7 Nov 2018 23:45:52 +0100
Message-ID: <2dad0537-6efe-16f3-6d8e-5d25002aa9c3@eikelenboom.it>
References: <3a55659d-4d7e-ea03-0c46-cd115ff1d8f9@eikelenboom.it>
 <9db95104-1378-f40e-db3a-8ccd2aa89b9f@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=35+5=ns=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1gKWZh-0007Zt-5z
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 22:45:25 +0000
In-Reply-To: <9db95104-1378-f40e-db3a-8ccd2aa89b9f@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTEvMTggMjM6MzQsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAxMS83LzE4IDQ6
MzAgQU0sIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4gSGkgSnVlcmdlbiAvIEJvcmlzLAo+
Pgo+PiBMYXN0IHdlZWsgaSB0ZXN0ZWQgTGludXgga2VybmVsIDQuMTkuMCBzdGFibGUgd2l0aCB0
aGUgWGVuICJmb3ItbGludXMtNC4yMCIgYnJhbmNoIHB1bGxlZCBvbiB0b3AuCj4+IFVuZm9ydHVu
YXRlbHkgaSB3YXMgc2VlaW5nIGd1ZXN0cyBsb2NrdXAgYWZ0ZXIgc29tZSB0aW1lLCBzZWUgYmVs
b3cgZm9yIHRoZSBsb2dnaW5nIGZyb20gb25lIG9mIHRoZSBndWVzdAo+PiB3aGljaCBpIHdhcyBh
YmxlIHRvIGNhcHR1cmUuCj4+IFJldmVydGluZyAieGVuOiBtYWtlIHhlbl9xbG9ja193YWl0KCkg
bmVzdGFibGUiIDcyNTBmNmQzNTY4MWRmYzQ0NzQ5ZDkwNTk4YTJkNTFhMTE4Y2UyYjgsCj4+IG1h
ZGUgdGhlIGxvY2t1cHMgZGlzYXBwZWFyLgo+Pgo+PiBUaGVzZSBndWVzdHMgYXJlIHN0cmVzc2Vk
IHF1aXRlIGhhcmQgaW4gYm90aCBDUFUgYW5kIG5ldHdvcmtpbmcsIAo+PiBzbyB0aGV5IGFyZSBw
cm9iYWJseSBtb3JlIHN1c2NlcHRpYmxlIHRvIGxvY2tpbmcgaXNzdWVzLgo+Pgo+PiBTeXN0ZW0g
aXMgYSBBTUQgcGhlbm9tIHg2LCBydW5uaW5nIFhlbi11bnN0YWJsZS4KPj4KPj4gQW55IGlkZWFz
ID8KPiAKPiAKPiBCeSBhbnkgY2hhbmNlLCBpcyBWTVBVIG9uPwo+IAo+IAo+IC1ib3Jpcwo+IAoK
SGFkIHRvIGxvb2sgdXAgd2hhdCB0aGF0IGlzIDopLCBidXQgc2VlbXMgb25seSBhcHBsaWNhYmxl
IHRvIFBWIGd1ZXN0cyBpZiBpJ20gY29ycmVjdCA/CgpJJ20gb25seSBydW5uaW5nIFBWSCBhbmQg
SFZNIGd1ZXN0cyBhdCB0aGUgbW9tZW50LCBleGNlcHQgZm9yIGRvbTAgb2YgY291cnNlLAp3aGlj
aCByZXBvcnRzOgogICAgWyAgICAwLjk0MTQwN10gVlBNVSBkaXNhYmxlZCBieSBoeXBlcnZpc29y
LgoKVGhlc2Ugc29mdCBsb2NrdXBzIHdlcmUgaW4gYSBIVk0gZ3Vlc3QgKGlmIGkgcmVtZW1iZXIg
Y29ycmVjdGx5LCBpIGhhdmUgc2VlbgphIFBWSCBndWVzdCBsb2NrdXAgYXMgd2VsbCBhZnRlciBh
IHdoaWxlIChhbHNvIGEgcXVpdGUgaGVhdnkgY3B1L25ldHdvcmsgc3RyZXNzZWQgb25lKS4KCi0t
ClNhbmRlcgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
