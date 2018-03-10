From: Michael Young <m.a.young@durham.ac.uk>
Subject: Re: [PATCH 1/2] make xen ocaml safe-strings compliant
Date: Sat, 10 Mar 2018 00:36:12 +0000 (GMT)
Message-ID: <alpine.LFD.2.21.1803092352560.3092@austen3.home>
References: <alpine.LFD.2.21.1801302254440.2952@austen3.home>
 <1518112198.5629.68.camel@suse.com>
 <20180208180348.moi3fujoq22fkkqg@citrix.com>
 <20180208182400.g4qlkiaetnvqhuo6@citrix.com>
 <EAB71B74-BDA5-49CD-9C55-6BB3BCDC3FB1@citrix.com>
 <20180212145519.ovy6zfusvhsd24s7@citrix.com>
 <alpine.LFD.2.21.1803092248590.3092@austen3.home>
 <C2CE6FE9-8010-4936-A2C7-32C0DAAD05F9@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-2075177674-1520639636=:3092"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8oal=ga=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1euSUs-0005JY-Df
 for xen-devel@lists.xenproject.org; Sat, 10 Mar 2018 00:36:26 +0000
In-Reply-To: <C2CE6FE9-8010-4936-A2C7-32C0DAAD05F9@citrix.com>
Content-ID: <alpine.LFD.2.21.1803092356420.3092@austen3.home>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, John Thomson <git@johnthomson.fastmail.com.au>, Dario Faggioli <dfaggioli@suse.com>, Marcello Seri <marcello.seri@citrix.com>, David Scott <dave@recoil.org>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2075177674-1520639636=:3092
Content-Type: text/plain; CHARSET=UTF-8; FORMAT=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LFD.2.21.1803092356421.3092@austen3.home>

On Fri, 9 Mar 2018, Christian Lindig wrote:

>
>
>> On 9. Mar 2018, at 22:57, Michael Young <m.a.young@durham.ac.uk> wrote:
>>
>> I have had a go at fixing the patch and my revised attempt is attached. I suspect it could be tidied up, but it works for me.
>
> Thank you for giving this another go. What is the key difference to the previous patch which compiled but lead to lock up at run time? I briefly tried your patch and can confirm that it compiles and looks clean except for two trailing spaces.
>
> — Christian
>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>

The problem with the old patch is illustrated by the following section 
from the old patch for tools/ocaml/xenstored/utils.ml
@@ -85,7 +85,7 @@ let create_unix_socket name =
  let read_file_single_integer filename =
         let fd = Unix.openfile filename [ Unix.O_RDONLY ] 0o640 in
         let buf = String.make 20 (char_of_int 0) in
-       let sz = Unix.read fd buf 0 20 in
+       let sz = Unix.read fd (Bytes.of_string buf) 0 20 in
         Unix.close fd;
         int_of_string (String.sub buf 0 sz)

where the patch makes Unix.read write to a Bytes copy of buf and buf 
itself is unchanged, so int_of_string sees a string of null characters 
rather than a string to convert into a number. The net result is that 
information being read by oxenstored from the hypervisor is corrupted or 
lost.
The same basic problem also occurred in a couple of places in 
the old patch of tools/ocaml/libs/xb/xb.ml.
My fix for this is to switch to Bytes at an earlier stage, so for example 
the corresponding section in the new patch becomes
@@ -84,10 +84,10 @@ let create_unix_socket name =

  let read_file_single_integer filename =
  	let fd = Unix.openfile filename [ Unix.O_RDONLY ] 0o640 in
-	let buf = String.make 20 (char_of_int 0) in
+	let buf = Bytes.make 20 (char_of_int 0) in
  	let sz = Unix.read fd buf 0 20 in
  	Unix.close fd;
-	int_of_string (String.sub buf 0 sz)
+	int_of_string (Bytes.to_string (Bytes.sub buf 0 sz))

  let path_complete path connection_path =
  	if String.get path 0 <> '/' then

 	Michael Young
--8323328-2075177674-1520639636=:3092
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323328-2075177674-1520639636=:3092--
